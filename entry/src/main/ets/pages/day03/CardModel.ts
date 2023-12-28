/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-16 14:38
 */
// @Component
export default class CardModel{
  cardImage:string;
  cardName: string;
  cardType: string;
  cardNumber: string;
  isDefault: boolean;

  constructor(cardImage:string, cardName: string, cardType: string, cardNumber: string, isDefault: boolean) {
    this.cardImage = cardImage;
    this.cardName = cardName;
    this.cardType = cardType;
    this.cardNumber = cardNumber;
    this.isDefault = isDefault;
  }
}