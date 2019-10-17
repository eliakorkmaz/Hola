# Hola

#### Light-weight Onboard/Walkthrough View for iOS written Swift 3

`Hola` is a `UIView` that represent several views or images as `View Pager`, `Onboard` `Walkthrough` in different direction as `Vertical` or `Horizontal`. Its a subclass of `UIView`.

# Gif for UIImage

![verticalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/gifVertical.gif?raw=true) ![horizontalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/horizontalGif.gif?raw=true)

# Gif for UIView

![verticalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/viewgifhorizontal.gif?raw=true) ![horizontalGif](https://github.com/eliakorkmaz/Hola/blob/master/gif/viewgifvertical.gif?raw=true)

# Update

## Support for Storyboard

```swift
    @IBOutlet weak var holaView: Hola!

    override func viewDidLoad() {
        super.viewDidLoad()


        let _image1: UIImage = UIImage(named:"image1")!
        let _image2: UIImage = UIImage(named:"image2")!
        let _image3: UIImage = UIImage(named:"image3")!
        let _image4: UIImage = UIImage(named:"image2")!

        let imageArray: [UIImage] = [_image1,_image2,_image3,_image4]
        let viewArray: [UIView] = [...........yourViews]

        holaView.prepareImagesForStoryboard(uiimageArray: imageArray, rotation: .vertical)

        holaView.prepareViewsForStoryboard(viewArray: viewArray, rotation: .horizontal)

    }
```

- Use prepareImagesForStoryboard or prepareViewsForStoryboard methods for preparing of @IBOutlet variable.

# Init

```swift
public init(frame: CGRect, viewArray uiviewArray:[UIView], _ rotation: rotationWay)
```

If you build pager with array of `UIView` you should use this `init` function.

let simple: Hola = Hola(frame: CGRect(), viewArray: viewArray, .horizontal)

````

Another `init function`
```swift
public init(frame: CGRect, imageArray uiimageArray:[UIImage],_ rotation:rotationWay)
````

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

`rotationWay` is used for specify `Hola`'s rotation as `horizontal`horizontal or `vertical`.

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

### Cons

- The main cons of the Hola is that using the UIScrollView. If you use 1000 image for the this UIScrollView, the app wants to all image on memory, so thats not practible. If you build such a tool with UICollectionView, it will handle the photos with lazy loading, so just some of images will be load into memory which is currently showing to the user on the screen. The main difference and disadvantage of it is about not memory friendly.

## License

_MIT_

❤ **Open Source**
