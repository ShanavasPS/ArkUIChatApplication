
@Component
export struct MySlider {

  @State outSetValueOne: number = 40
  build() {
        Slider({
          value: this.outSetValueOne,
          min: 0,
          max: 100,
          style: SliderStyle.OutSet
        })
    .backgroundColor(Color.Orange)
  }
}

