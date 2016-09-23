class RMVisualizer

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

    body {
        display: flex;
        flex-direction: column
    }

    ul {
      list-style: none;
      margin-top: 10px;
/*       margin-right: 20px; */
      font-size: 18px;
      width: 350px;
      font-size: 20px;
    }

    ul li, .list-name {
      text-decoration: none;
      padding-top: 5px;
      font-size: 16px;
    }

    ul li:first-child, .list-name:first-child {
        margin-top: 10px;
    }

    .model {
      border: 5px solid black;
      margin: 10px;
      padding: 10px;
      color: white;
      background-color: red;
      padding: 20px;
      text-align: center;
    }

    h1 {
     font-size: 40px;
     text-align: center;
    }

    .model-details {
      display: flex;
      justify-content: space-between;
    }

    .list-source {
      display: none;
      position: absolute;
      background-color: #ccc;
      color: black;
      z-index: 1;
      left:150px;
      padding: 5px;
      border-radius: 3px;
      text-align: left;
    }

    .list-name:hover > div {
      display: block;
    }

    .list-name {
      position: relative;
      cursor: pointer;
    }

    .superclass {
       display flex;
       border: 10px solid black;
       text-align: center;
       font-size: 40px;
       padding: 10px;
    }"

  end

  def self.html(body)
    start = "<!DOCTYPE html>
    <html>
      <head>
        <meta charset=\"utf-8\">
        <title>Rails Model Visualizer</title>
        <link rel=\"stylesheet\" media=\"all\" href=\"./application.css\">
      </head>
      <body>"

    finish = "</body> </html>"

    return(start + body + finish)
  end

end
