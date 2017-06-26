import json
from os import listdir
from pypandoc import convert_file

title = "Project Euler Solutions"
fonts = "https://fonts.googleapis.com/css?family=Source+Code+Pro|Source+Sans+Pro|Source+Serif+Pro"
style = "style.css"
intro = "resources/intro.md"
problemTitles = json.loads(open("resources/titles.json").read())

def html(elements):
  return "".join(elements)

def renderSolution(n):
  return html([
    "<div class='solution' id='{}'>".format(n),
      "<div class='solution-title'>",
        "<h2>",
          "<a href='#{}'>".format(n),
          "<span class='hash'># </span>",
          problemTitles[int(n) - 1],
          "</a>",
        "</h2>",
        "<span class='statement'>",
          "<a href='https://projecteuler.net/problem={}'>".format(n),
            "[{}]".format(n),
          "</a>",
        "</span>",
      "</div>",
      convert_file("src/{}.lhs".format(n), "html", format="markdown+lhs"),
    "</div>",
  ])

def render():
  return html([
    "<!doctype html>",
    "<html>",
    "<head>",
      "<title>{}</title>".format(title),
      "<link href='{}' rel='stylesheet'>".format(fonts),
      "<link href='{}' rel='stylesheet'>".format(style),
    "</head>",
    "<body>",
      "<h1>{}</h1>".format(title),
      "<div class='intro'>{}</div>".format(
        convert_file(intro, "html")
      ),
      html(renderSolution(n) for n in [
        f.split(".")[0] for f in listdir("src") if f.endswith(".lhs")
      ]),
    "</body>",
    "</html>",
  ])

print(render())
