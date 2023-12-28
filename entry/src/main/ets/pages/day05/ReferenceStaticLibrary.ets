/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-19 10:42
 */
import { MyStaticLibrary } from 'mylibrary'
import { PullRefreshLoadMore } from 'mylibrary'
@Entry
@Component
struct ReferenceStaticLibrary{
  build(){
    Column(){
      //MyStaticLibrary()
      PullRefreshLoadMore()
    }
  }
}