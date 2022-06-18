<h3 align="center">
    <img alt="Nasa image" src="https://yt3.ggpht.com/ytc/AKedOLRb1ugnpZU9Cb2wF07qqiwvVQ6ZJTfMxkrVXPUMh_A=s900-c-k-c0x00ffffff-no-rj" height="250px" width="250px"/>
    <br>
    <b>Astronomy Picture of the Day App</b>  
    <br>
</h3>
  
<p align="center">
  <a href="#about">About</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#features">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#used-packages">Used Packages</a>
</p>


<a id="about"></a>

## About

<strong>APOD App</strong> is a mobile application for viewing and searching the Astronomy Picture of the Day, in which it is possible to search the photos by period, randomly and the possibility of downloading. Developed in [Flutter](https://www.flutter.dev/), using [NASA Open API APOD](https://api.nasa.gov/), as a selection process for [CloudWalk](https://www.cloudwalk.io/) and making use mainly of clean architecture, TDD and cache.


*Visible environment variables to be able to run the app, but not is correct. It is recommended you use flutter_dotenv to store your environment variables and put the .env file in your .gitignore.

### UI Demonstration

<img src="https://user-images.githubusercontent.com/51024246/174413732-a5763b72-7e40-44f5-bab1-c2342ed67d82.png" height="480px"> <img src="https://user-images.githubusercontent.com/51024246/174413724-3abfecc0-eedb-4764-bc47-09c2df1ed098.png" height="480px"> <img src="https://user-images.githubusercontent.com/51024246/174413721-f8273c36-0b9c-4a6b-8027-88fdb37fd8a5.png" height="480px"> <img src="https://user-images.githubusercontent.com/51024246/174414244-6369bc3a-d282-4ded-8a1e-52550b3d9051.png" height="480px">

<a id="features"></a>

### Features

- [x] Clean Architecture
- [x] SOLID
- [x] ValueNotifier
- [x] Consume photo of the day [APOD API](https://github.com/nasa/apod-api);
- [x] Dependency injection with Get It
- [x] Home Page
- [x] Apod Details Page
- [x] Search by range of begin date and end
- [x] Random list search of Astronomy Images of the Day
- [x] Unit Test
- [x] Widget Test
- [x] Using the app offline (cache)
- [x] Responsive Layout
- [x] Pull to refresh
- [x] Download of image
- [x] Laucher icon
- [x] Splash Screen


<a id="used-packages"></a>

## Used packages

This project was developed using the following technologies:

- [equatable](https://pub.dev/packages/transparent_image)
- [dartz](https://pub.dev/packages/dartz)
- [http](https://pub.dev/packages/http)
- [get_it](https://pub.dev/packages/get_it)
- [shared_preferences](https://pub.dev/packages/shared_preferences)
- [image_downloader](https://pub.dev/packages/image_downloader)
- [mockito](https://pub.dev/packages/mockito)
- [build_runner](https://pub.dev/packages/build_runner)
- [intl](https://pub.dev/packages/intl)
- [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons)
- [flutter_native_splash](https://pub.dev/packages/flutter_native_splash)


<a id="how-to-use"></a>

&nbsp;
## Getting started <a name="getting_started"></a>

### Standard environment <a name="standard_env"></a>

1. Clone the repo
```bash
git clone https://github.com/ReinanS/apod_app
```
2. `cd` into the new directory
```bash
cd apod_app
```
3. Install packages
```bash
flutter pub get
```


<a id="how-to-contribute"></a>

## How to Contribute

- Fork this repository
- Create your branch with your contribution: `git checkout -b my-feature`
- Commit your changes: `git commit -m 'feat: My new feature' `
- Push your branch: `git push origin my-feature`

---

<h4 align="center">
    Made by <a href="https://www.linkedin.com/in/reinan-santos99/" target="_blank">Reinan Santos</a>
</h4>
