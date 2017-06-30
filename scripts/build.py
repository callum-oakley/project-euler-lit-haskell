import json, os, pypandoc

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
            problemTitles[n],
          "</a>",
        "</h2>",
        "<span class='statement'>",
          "<a href='https://projecteuler.net/problem={}'>".format(n),
            "[{}]".format(n),
          "</a>",
        "</span>",
      "</div>",
      pypandoc.convert_file(
        "src/{}.lhs".format(n),
        "html",
        format="markdown+lhs"
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
        pypandoc.convert_file(intro, "html")
      ),
      html(renderSolution(n) for n in [
        f.split(".")[0] for f in os.listdir("src") if f.endswith(".lhs")
      ]),
    "</body>",
    "</html>",
  ])

print(render())