import json, os, pypandoc, pystache

problemTitles = json.loads(open("resources/titles.json").read())

intro = pypandoc.convert_file(
    "resources/intro.md",
    "html",
    format="commonmark",
    extra_args=["--smart"],
)

def hsToMd(hs):
    lines = hs.split("\n")
    codeLocations = {
        i for i in range(len(lines))
            if (not lines[i].startswith("--")) and
                (i == 0 or not lines[i - 1].startswith("--")) and
                (i == len(lines) - 1 or not lines[i + 1].startswith("--"))
    }
    md = ""
    for i, line in enumerate(lines):
        if line.startswith("-- "):
            md += line[3:] + "\n"
        elif line == "--":
            md += "\n"
        elif i in codeLocations:
            md += "    " + line + "\n"
        elif line == "":
            md += "\n"
        else:
            raise ValueError("Bad format at line {}".format(i + 1))
    return md

def solutionBody(n):
    return pypandoc.convert_text(
        hsToMd(open("src/{}.hs".format(n)).read()),
        "html",
        format="commonmark",
        extra_args=["--smart"],
    )

fileNumbers = [f.split(".")[0] for f in os.listdir("src") if f.endswith(".hs")]

print(pystache.render(open("resources/index.html.mustache").read(), {
    "intro": intro,
    "solutions": [{
        "problemNumber": n,
        "problemTitle": problemTitles[n],
        "solutionBody": solutionBody(n),
    } for n in fileNumbers],
}))
