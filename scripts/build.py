import json, os, pypandoc, pystache

problemTitles = json.loads(open("resources/titles.json").read())

print(pystache.render(open("resources/index.html.mustache").read(), {
    "intro": pypandoc.convert_file(
        "resources/intro.md",
        "html",
        extra_args=["--smart"],
    ),
    "solutions": [{
        "problemNumber": n,
        "problemTitle": problemTitles[n],
        "solutionBody": pypandoc.convert_file(
            "src/{}.lhs".format(n),
            "html",
            format="markdown+lhs",
            extra_args=["--smart"],
        ),
    } for n in [
        f.split(".")[0] for f in os.listdir("src") if f.endswith(".lhs")
    ]],
}))
