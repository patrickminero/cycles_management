import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "container" ]

  connect() {
    console.log(`Hello!`)
  }

  addField(e){
    let counter = 1
    e.preventDefault()
    //Add fields to form
    const field = `<h1 class="text-2xl mb-4">Subcomponent</h1>
    <div class="field">
      <input name='cycle[subcomponent_name${Math.ceil(Math.random() * counter)}]' id="cycle[subcomponent_name]" class="p-16 bg-white focus:outline-none focus:shadow-outline border border-gray-500 rounded-md py-2 px-2 block appearance-none leading-normal w-full"  placeholder='Subcomponent name' />
    </div>

    <div class="field">
      <label for='cycle[subcomponents]' class='text-3xl mb-4'>Impacts</label>
      <input type="number" name='cycle[climate_change${Math.ceil(Math.random() * counter)}]' class="p-16 bg-white focus:outline-none focus:shadow-outline border border-gray-500 rounded-md py-2 px-2 block appearance-none leading-normal w-full mb-2" placeholder='Climate change' />
      <input type="number" name='cycle[water_use${Math.ceil(Math.random() * counter)}]' class="p-16 bg-white focus:outline-none focus:shadow-outline border border-gray-500 rounded-md py-2 px-2 block appearance-none leading-normal w-full mb-2" placeholder='Water use' />
    </div>`
    this.containerTarget.insertAdjacentHTML('beforeend', field)
    counter ++
  }
}