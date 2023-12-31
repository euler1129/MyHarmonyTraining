/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { BottomTabsItem, CommonConstants as Const } from 'common';
import { BottomTabsList } from '../viewmodel/BottomTabsModel';

function getTabImgSrc(item: BottomTabsItem, index: number) {
  let imgSrc = item.icon;
  if (BottomTabsList.indexOf(item) === index) {
    imgSrc = item.iconSelected;
  }
  return imgSrc;
}

function getTabTextColor(item: BottomTabsItem, index: number) {
  let color = $r('app.color.bottom_tabs_font_color');
  if (BottomTabsList.indexOf(item) === index) {
    color = $r('app.color.bottom_tabs_font_color_selected');
  }
  return color;
}

@Component
export struct BottomTabs {
  @Link bottomTabIndex: number;

  build() {
    Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceEvenly, alignItems: ItemAlign.Center }) {
      ForEach(BottomTabsList, (item: BottomTabsItem) => {
        Column() {
          Image(getTabImgSrc(item, this.bottomTabIndex))
            .width(Const.BOTTOM_IMAGE_SIZE)
            .height(Const.BOTTOM_IMAGE_SIZE)
            .objectFit(ImageFit.Contain)
            .margin({ bottom: $r('app.float.bottom_margin') })

          Text(item.text)
            .fontSize($r('app.float.bottom_font_size'))
            .opacity(Const.OPACITY)
            .fontColor(getTabTextColor(item, this.bottomTabIndex))
        }
        .width(Const.BOTTOM_TAB_WIDTH)
        .onClick(() => {
          this.bottomTabIndex = BottomTabsList.indexOf(item);
        })
      }, (item: BottomTabsItem) => JSON.stringify(item))
    }
    .width(Const.FULL_SIZE)
    .height(Const.BOTTOM_TAB_HEIGHT)
    .backgroundColor($r('app.color.bottom_tabs_background_color'))
  }
}