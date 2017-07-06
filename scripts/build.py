import json, os, pypandoc, pystache

problemTitles = json.loads(open("resources/titles.json").read())

intro = pypandoc.convert_file(
    "resources/intro.md",
    "html",
    extra_args=["--smart"],
)

def solutionBody(n):
    return pypandoc.convert_file(
        "src/{}.lhs".format(n),
        "html",
        format="markdown+lhs",
        extra_args=["--smart"],
    )

fileNumbers = [f.split(".")[0] for f in os.listdir("src") if f.endswith(".lhs")]

print(pystache.render(open("resources/index.html.mustache").read(), {
    "intro": intro,
    "solutions": [{
        "problemNumber": n,
        "problemTitle": problemTitles[n],
        "solutionBody": solutionBody(n),
    } for n in fileNumbers],
}))
