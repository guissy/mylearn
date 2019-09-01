class CategoryItem {
  String name;
  String icon;
  int color;
  static List<CategoryItem> items = List.from(
      [
        CategoryItem.create('事件', 'events', 0xff68cdff),
        CategoryItem.create('控制', 'control', 0xfffbbda2),
        CategoryItem.create('运算', 'calculator', 0xff7E683B),
        CategoryItem.create('字符串', 'string', 0xff77e354),
        CategoryItem.create('变量', 'variable', 0xfff5b768),
        CategoryItem.create('列表', 'list', 0xffffd263),
        CategoryItem.create('字典', 'dictionary', 0xff7d68f1),
        CategoryItem.create('函数', 'functions', 0xfff08f63),
      ]
  );

  CategoryItem(this.name, this.icon, this.color);

  CategoryItem.create(this.name, this.icon, this.color);

}

