import { Controller } from 'stimulus'

export default class extends Controller {
  toggleMenu() {
    const menu = this.element.querySelector('#menu')
    menu.classList.toggle('hidden')
  }
}