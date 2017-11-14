# Hola
#### Light-weight Onboard/Walkthrough View for iOS written Swift 3

`Hola` is a `UIView` that represent several views or images as `View Pager`, `Onboard` `Walkthrough` in different direction as `Vertical` or `Horizontal`. Its a subclass of `UIView`.

# Gif for UIImage


![verticalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/gifVertical.gif?raw=true)   ![horizontalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/horizontalGif.gif?raw=true)

# Gif for UIView


![verticalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/viewgifhorizontal.gif?raw=true)   ![horizontalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/viewgifvertical.gif?raw=true)



# Init

```swift
public init(frame: CGRect, viewArray uiviewArray:[UIView], _ rotation: rotationWay)
```
If you build pager with array of `UIView` you should use this `init` function.

Simple `usage` of it.
```swift
let simple: Hola = Hola(frame: CGRect(), viewArray: viewArray, .horizontal)
```

Another `init function`
```swift
public init(frame: CGRect, imageArray uiimageArray:[UIImage],_ rotation:rotationWay)
```
For creating `Hola` with array of `UIImage`, use this `init` function to generate it.

Here is the another example for `usage`.

```swift
let simple: Hola = Hola(frame: CGRect(), imageArray: imageArray, .vertical)
```





# Structs
```swift
public enum rotationWay {
case horizontal
case vertical
}
```
`rotationWay` is used for specify `Hola`'s  rotation as `horizontal`horizontal or `vertical`.




### Manually Installation

```sh
git clone REPO_URL
cd Hola/
use Hola.swift
```



### Development
Want to contribute?
Feel free to contribute anything on this with describing contributed part


### Todos
- Some transaction animations
- Feel free to play with repo.

## License
*MIT*

❤   **Open Source**
