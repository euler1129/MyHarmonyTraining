
/**
 * Function params object.
 */
export interface ParamsItem {
  callID: number,
  data: ParamsDataItem
}

/**
 * ParamsDataItem.
 */
export interface ParamsDataItem {
  name?: string;
  tel?: string
}