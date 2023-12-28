
import { ItemDirection } from './ItemDirection';

/**
 * Chat list item info.
 */
export default class ChatData {
  /**
   * Chat list item direction.
   */
  itemDirection: ItemDirection = ItemDirection.LEFT;

  /**
   * Chat list item content.
   */
  content: Resource = $r('app.string.empty');
}