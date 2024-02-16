var series = root.container.children.push(
  am5hierarchy.Tree.new(root, {
    valueField: "value",
    categoryField: "name",
    childDataField: "children",
    orientation: "vertical"
  })
);

series.circles.template.setAll({
  fillOpacity: 0.7,
  strokeWidth: 1,
  strokeOpacity: 1
});

series.outerCircles.template.setAll({
  strokeWidth: 2
});

series.outerCircles.template.states.create("disabled", {
  fillOpacity: 0.5,
  strokeOpacity: 0,
  strokeDasharray: 0
});

series.outerCircles.template.states.create("hoverDisabled", {
  fillOpacity: 0.5,
  strokeOpacity: 0,
  strokeDasharray: 0
});

series.circles.template.setAll({
  radius: 20
});

series.outerCircles.template.setAll({
  radius: 20
});

series.nodes.template.setAll({
  toggleKey: "none",
  cursorOverStyle: "default"
});