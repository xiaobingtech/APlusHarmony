import { preferences } from '@kit.ArkData'
import { promptAction, router } from '@kit.ArkUI';
import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { efRcpClientApi } from '@yunkss/ef_rcp';

@Entry
@Component
struct WelcomePage {
  @State message: string = 'Hello World';

  build() {
    RelativeContainer() {
      Text('')
    }
    .height('100%')
    .width('100%')
    .onAppear(async () => {
      let data = preferences.getPreferencesSync(getContext(this), { name: 'token.db' })
      let access_token = data.getSync('access_token', '')
      if (access_token != '') {
        // data?.putSync('access_token', result!.access_token)
        // data?.putSync('refresh_token', result!.refresh_token)
        // data?.flush()
        router.replaceUrl({
          url: 'pages/TabPage'
        })
      }else{
        router.replaceUrl({
          url: 'pages/LoginPage'
        })
      }
    })
  }
}