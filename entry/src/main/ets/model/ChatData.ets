
let NextId = 0;
export default class ChatData {
  id: string;
  name: string;
  message: string;
  time: string;

  constructor(name: string, message: string, time: string) {
    this.id = `${ NextId++ }`;
    this.name = name;
    this.message = message;
    this.time = time;
  }
}