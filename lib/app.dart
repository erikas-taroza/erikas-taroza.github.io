import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart";

import "components/text_field.dart";

@client
class App extends StatefulComponent {
  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  void onEnter(String text) {
    if (text.isEmpty) return;
    // Go straight to website with prefix.
    if (text.substring(0, 1) == ":") {
      window.location.href = "https://${text.substring(1)}";
      return;
    }

    Uri? uri = Uri.tryParse(text);
    // Full URL
    if (uri != null && uri.hasScheme && uri.hasAuthority) {
      window.location.href = uri.toString();
    }
    // Search query
    else {
      window.location.href = "https://duckduckgo.com/?q=${Uri.encodeComponent(text)}";
    }
  }

  @override
  Component build(BuildContext context) {
    return div(classes: "main", [
      h1([.text("Erikas Taroza")]),
      TextField(onEnter: onEnter, hint: "Search DuckDuckGo or enter URL", width: 40.vw),
      p([.text("Prefix with `:` to go to a website.")]),
    ]);
  }

  @css
  static List<StyleRule> get styles => [
    css(".main", [
      css("&").styles(
        display: .flex,
        flexDirection: .column,
        flexWrap: .wrap,
        justifyContent: .center,
        alignItems: .center,
        margin: Spacing.only(top: 25.vh),
      ),
      css("p").styles(color: Colors.gray),
    ]),
  ];
}
