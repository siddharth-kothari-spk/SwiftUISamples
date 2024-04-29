// https://tyirvine.medium.com/how-to-create-a-square-grid-using-swiftui-e8d6c3027a6c
import SwiftUI
import PlaygroundSupport

let squareSize: CGFloat = 40
let colors = [
   Color.red,
   Color.blue,
   Color.green,
   Color.yellow,
]

let spacingDesired: CGFloat = 25

let rows = [
   GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center),
   GridItem(.fixed(squareSize), spacing: spacingDesired, alignment: .center)
]

struct Square: View {
  var color: Color
  
  var body: some View {
    RoundedRectangle(cornerRadius: 0)
      .frame(width: squareSize, height: squareSize, alignment: .center)
      .foregroundColor(color)
    }
}

struct SquareGrid: View {
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: spacingDesired, pinnedViews: [], content: {
                    ForEach(0 ..< 4) { colorIndex in
                        Square(color: colors[colorIndex])
                    }
                })
    }
}

let view = SquareGrid()

// UIHostingController
//let hostingVC = UIHostingController(rootView: view)
//PlaygroundPage.current.liveView = hostingVC

// setLiveView
PlaygroundPage.current.setLiveView(view)
