import "dart:async";

import "package:jaspr/dom.dart";
import "package:jaspr/jaspr.dart";
import "package:universal_web/web.dart" as web;

import "../constants/theme.dart";

class TextField extends StatefulComponent {
  final void Function(String text) onEnter;
  final String hint;
  final Unit? width;
  final bool autofocus;

  TextField({super.key, required this.onEnter, required this.hint, this.width, this.autofocus = true});

  @override
  State<StatefulComponent> createState() => _TextField();

  // Translated https://codepen.io/dasxcxzc/pen/xxvWMaq with some modifications.
  @css
  static List<StyleRule> get styles {
    final focusedLabelStyle = Styles(
      fontSize: 11.px,
      position: .absolute(top: 2.px),
    );

    return [
      css(".filled", [
        css("&").styles(position: .relative(), textAlign: .left),
        css("input", [
          css("&").styles(
            backgroundColor: Color("#1b1b1b"),
            border: Border.only(
              bottom: BorderSide.solid(color: Colors.gray, width: 1.px),
              top: BorderSide.none(),
              left: BorderSide.none(),
              right: BorderSide.none(),
            ),
            transition: Transition("all", duration: Duration(milliseconds: 500)),
            outline: Outline.unset,
            padding: Spacing.fromLTRB(10.px, 15.px, 10.px, 5.px),
            radius: BorderRadius.only(topLeft: Radius.circular(5.px), topRight: Radius.circular(5.px)),
            fontSize: 15.px,
            fontFamily: FontFamily.inherit,
            color: textColor,
          ),
          css("&:hover").styles(
            backgroundColor: const Color("#303030"),
            border: Border.only(
              bottom: BorderSide.solid(color: Colors.white, width: 1.px),
            ),
          ),
          css("&:focus").styles(
            backgroundColor: const Color("#303030"),
            border: Border.only(
              bottom: BorderSide.solid(color: primaryColor, width: 1.5.px),
            ),
          ),
        ]),
        css("label").styles(
          content: "",
          position: .absolute(top: 10.px, left: 10.px),
          color: Colors.gray,
          fontSize: 15.px,
          pointerEvents: .none,
          transition: Transition("all", duration: Duration(milliseconds: 200), curve: Curve.ease),
          fontFamily: FontFamily.inherit,
          textOverflow: .ellipsis,
          overflow: .hidden,
          whiteSpace: .noWrap,
          display: .block,
        ),
        css("input:valid ~ label").styles(color: Colors.gray).combine(focusedLabelStyle),
        css("input:focus ~ label").styles(color: primaryColor).combine(focusedLabelStyle),
      ]),
    ];
  }
}

class _TextField extends State<TextField> {
  final GlobalNodeKey<web.HTMLInputElement> inputKey = GlobalNodeKey();

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) return;

    final input = web.document.getElementById("input") as web.HTMLInputElement;
    input.value = "";

    if (!component.autofocus) return;
    // Strange bug. Focuses successfully after a 0ms delay.
    Future.delayed(Duration(milliseconds: 0)).then((_) {
      input.focus();
    });
  }

  @override
  Component build(BuildContext context) => div(classes: "filled", [
    input(
      key: inputKey,
      attributes: {"required": ""},
      type: InputType.text,
      id: "input",
      styles: Styles(width: component.width),
      events: {
        "keyup": (e) {
          if ((e as web.KeyboardEvent).key != "Enter") return;
          component.onEnter(inputKey.currentNode?.value ?? "");
          inputKey.currentNode?.value = "";
        },
      },
    ),
    label(styles: Styles(width: component.width), [Component.text(component.hint)], htmlFor: "input"),
  ]);
}
