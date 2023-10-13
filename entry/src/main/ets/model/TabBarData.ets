
let NextId = 0;

export default class TabBarData {
  id: string;
  text: string;
  num: number;
  image: string;
  image_selected: string;

  constructor(text: string, num: number, image: string, image_selected: string) {
    this.id = `${ NextId++ }`;
    this.text = text;
    this.num = num;
    this.image = image;
    this.image_selected = image_selected;
  }
}