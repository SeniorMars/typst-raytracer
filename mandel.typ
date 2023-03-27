#set par(leading:0em)

#let mandelbrot() = {
  let red = 0
  let green = 0
  let blue = 0

  let width = 164
  let height = 250
  let max_iter = 256
  let cxmin = -2.0
  let cxmax = 1.0
  let cymin = -1.5
  let cymax = 1.5
  let scalex = ((cxmax - cxmin) / width)
  let scaley = ((cymax - cymin) / height)

  let zx;
  let zy;

  let zx2;
  let zy2;

  let yidx = 0
  while yidx < height {
      let cy = cymin + yidx * scaley
      let xidx = 0
      while xidx < width {
          let cx = cxmin + xidx * scalex


          zx = 0.0;
          zy = 0.0;
          zx2 = zx * zx;
          zy2 = zy * zy;

          let iter = 0

          while iter < max_iter and (zx2 + zy2) < 4.0 {
              zy = 2.0 * zx * zy + cy
                  zx = zx2 - zy2 + cx
                  zx2 = zx * zx
                  zy2 = zy * zy
                  iter += 1
          }


          red = calc.mod(iter, 4) * 64
          green = calc.mod(iter, 8) * 32
          blue = calc.mod(iter, 16) * 16

          [#box(fill: rgb(red, green, blue), height: 0.25em, width:0.25em)]

          xidx += 1
      }
      [\ ]
      yidx += 1
  }
}

#mandelbrot()
