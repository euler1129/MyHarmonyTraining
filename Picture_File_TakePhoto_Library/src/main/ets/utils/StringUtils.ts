/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 14:26
 */

export default class StringUtils {

  constructor() {

  }

  static isNotNullOrEmpty(str: string): boolean {
    return str === null || str === undefined || str === '' || str.trim().length === 0;
  }

}