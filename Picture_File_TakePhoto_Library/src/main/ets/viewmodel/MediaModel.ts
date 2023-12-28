/**
 * Author: xjf
 * Version: 1.0.0
 * Description:
 * CreateDateTime: 2023-12-25 14:03
 */

export default class MediaModel {

  constructor() {

  }

  private fileName: string;
  private fileSize: number;
  private fileType: string;
  private localUrl: string;

  getFileName(): string {
    return this.fileName;
  }

  setFileName(fileName: string): void {
    this.fileName = fileName;
  }

  getFileSize(): number {
    return this.fileSize;
  }

  setFileSize(fileSize: number): void {
    this.fileSize = fileSize;
  }

  getFileType(): string {
    return this.fileType;
  }

  setFileType(fileType: string): void {
    this.fileType = fileType;
  }

  getLocalUrl(): string {
    return this.localUrl;
  }

  setLocalUrl(localUrl: string): void {
    this.localUrl = localUrl;
  }

}
