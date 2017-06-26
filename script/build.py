from os import listdir
from pypandoc import convert_file

title = "Project Euler – Literate Haskell"
fonts = "https://fonts.googleapis.com/css?family=Source+Code+Pro|Source+Sans+Pro|Source+Serif+Pro"
style = "style.css"
intro = "<p>Solutions to the problems on <a href='https://projecteuler.net/'>projecteuler.net</a> written in <a href='https://wiki.haskell.org/Literate_programming'>Literate Haskell</a>. Source can be found <a href='https://github.com/hot-leaf-juice/project-euler/tree/master/src'>here</a>. Clone it and feed it to <code>ghci</code>!</p>" # TODO compile this from some markdown

def renderSolution(n):
  return "\n".join([
    "<div class='solution' id='{}'>".format(n),
      "<div class='solution-title'>",
        "<h2>",
          "<a href='#{}'>".format(n),
          "<span class='hash'># </span>",
          n,
          "</a>",
        "</h2>",
        "<span class='statement'>",
          "<a href='https://projecteuler.net/problem={}'>".format(n),
            "[statement]",
          "</a>",
        "</span>",
      "</div>",
      convert_file("src/{}.lhs".format(n), "html", format="markdown+lhs"),
    "</div>",
  ])

def render():
  html = "\n".join([
    "<!doctype html>",
    "<html>",
    "<head>",
      "<title>{}</title>".format(title),
      "<link href='{}' rel='stylesheet'>".format(fonts),
      "<link href='{}' rel='stylesheet'>".format(style),
    "</head>",
    "<body>",
      "<h1>{}</h1>".format(title),
      "<div class='intro'>{}</div>".format(intro),
  ])
  for n in [f.split(".")[0] for f in listdir("src") if f.endswith(".lhs")]:
    html += renderSolution(n)
  html += "</body>\n</html>"
  return html

print(render())
