class Diagramify

  def self.css
    "html, body, h1, ul, li,
    button, div, h2, h3, p {
      margin: 0;
      padding: 0;
      border: 0;
      outline: 0;
      font: inherit;
      color: inherit;
      text-align: inherit;
      text-decoration: inherit;
      vertical-align: inherit;
      box-sizing: inherit;
      background: transparent;
    }



    .model {
      border: 1px solid black;
    }"

  end

  def self.html(body)
    start = "<!DOCTYPE html>
    <html>
      <head>
        <meta charset=\"utf-8\">
        <title>Diagramify</title>
        <link rel=\"stylesheet\" media=\"all\" href=\"./application.css\">
      </head>
      <body>"

    finish = "</body> </html>"

    return(start + body + finish)
  end

end
