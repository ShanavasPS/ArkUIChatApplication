
let NextId = 0;

export default class UserData {
  id: string;
  name: string;
  image: string;

  constructor(name: string, image: string) {
    this.id = `${ NextId++ }`;
    this.name = name;
    this.image = image;
  }
}