@Preview
@Component
export struct ScoreView {
  @Builder NavigationMenus() {
    Row() {
      SymbolGlyph($r('sys.symbol.person'))
        .fontSize(24)
    }
    .padding(15)
    .bindContextMenu(this.PersonMenu(), ResponseType.RightClick)
  }

  @Builder
  PersonMenu(){
    Menu() {
      MenuItem({ startIcon: $r("app.media.app_icon"), content: "大宝" })
      MenuItem({ startIcon: $r("app.media.app_icon"), content: "二宝" })
    }
  }


  build() {
    NavDestination(){
      Column(){

      }
      .height('100%')
      .width('100%')
    }
    .title('A+成绩')
    .menus(this.NavigationMenus())
  }
}