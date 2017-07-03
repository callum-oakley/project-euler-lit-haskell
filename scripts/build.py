import json, os, pypandoc

title = "Project Euler Solutions"
fonts = "https://fonts.googleapis.com/css?family=Cinzel|Source+Sans+Pro|Source+Serif+Pro|Source+Code+Pro"
style = "style.css"
intro = "resources/intro.md"
problemTitles = json.loads(open("resources/titles.json").read())

def html(elements):
  return "".join(elements)

def renderSolution(n):
  return html([
    "<div class='solution' id='{}'>".format(n),
      "<h2>",
        "<a class='problem-title' href='#{}'>".format(n),
          "<span class='hash'># </span>",
          problemTitles[n],
        "</a>",
        "<a class='problem-statement' href='https://projecteuler.net/problem={}'>{}</a>".format(n, n),
      "</h2>",
      pypandoc.convert_file(
        "src/{}.lhs".format(n),
        "html",
        format="markdown+lhs",
        extra_args=["--smart"]
      ),
    "</div>",
  ])

def render():
  return html([
    "<!doctype html>",
    "<html>",
    "<head>",
      "<meta name='viewport' content='width=device-width, initial-scale=1'>",
      "<title>{}</title>".format(title),
      "<link href='{}' rel='stylesheet'>".format(fonts),
      "<link href='{}' rel='stylesheet'>".format(style),
    "</head>",
    "<body>",
      "<h1>{}</h1>".format(title),
      "<div class='intro'>{}</div>".format(
        pypandoc.convert_file(intro, "html", extra_args=["--smart"])
      ),
      html(renderSolution(n) for n in [
        f.split(".")[0] for f in os.listdir("src") if f.endswith(".lhs")
      ]),
    "</body>",
    "</html>",
  ])

print(render())
