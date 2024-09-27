import { preferences } from '@kit.ArkData'
import { router } from '@kit.ArkUI'
import { DerivedNavPathStack } from '../common/DerivedNavPathStack'
import { AnalyticView } from './AnalyticView';
import { ScoreView } from './ScoreView';
import { SettingView } from './SettingView';

@Entry
@Component
struct TabPage {
  @StorageProp('currentBreakpoint') currentBreakpoint: string = '';

  @State selectIndex : number = 0

  derivedStack: DerivedNavPathStack = new DerivedNavPathStack();

  aboutToAppear(): void {
    AppStorage.setOrCreate('derivedStack', this.derivedStack)
  }

  @Builder
  tabBarBuilder(index: number, title: string, img: string, sel_img: string) {
    if (this.currentBreakpoint !== 'md' ) {
      Column({space: 5}){
        SymbolGlyph(index == this.selectIndex ? $r(sel_img) : $r(img))
          .fontSize(30)
          .fontColor(index == this.selectIndex ? [$r('app.color.accent')] : [Color.Gray])
        Text(title).fontColor(index == this.selectIndex ? $r('app.color.accent') : Color.Gray)
      }
    }else{
      Row({space: 5}){
        SymbolGlyph(index == this.selectIndex ? $r(sel_img) : $r(img))
          .fontSize(30)
          .fontColor(index == this.selectIndex ? [$r('app.color.accent')] : [Color.Gray])
        Text(title).fontColor(index == this.selectIndex ? $r('app.color.accent') : Color.Gray)
      }
    }
  }

  build() {
    Navigation(this.derivedStack){
      Tabs({ barPosition: this.currentBreakpoint === "lg" ? BarPosition.Start : BarPosition.End }) {
        TabContent() {
          ScoreView()
        }
        .tabBar(this.tabBarBuilder(0, '成绩', 'sys.symbol.square_grid_2x2', 'sys.symbol.square_fill_grid_2x2'))

        TabContent() {
          AnalyticView()
        }
        .tabBar(this.tabBarBuilder(1, '分析', 'sys.symbol.bolt', 'sys.symbol.bolt'))

        TabContent() {
          SettingView()
        }
        .tabBar(this.tabBarBuilder(2, '设置', 'sys.symbol.gearshape', 'sys.symbol.gearshape'))
      }
      .onChange((index: number) => {
        this.selectIndex = index
      })
      .scrollable(false)
      .animationDuration(0)
      .width('100%')
      .barWidth(this.currentBreakpoint === "lg" ? 96 : '100%')
      .barHeight(this.currentBreakpoint === "lg" ? '60%' : 56)
      .vertical(this.currentBreakpoint === "lg")
    }
    .hideTitleBar(true)
  }
}