# iOS-Avanzanced practice

Create a mobile application to display information of Shops in Madrid, even when the user has no Internet connection. Shops should be shown in a Map.

## Requirements
1. When starting the App for the first time, if there's Internet connection it will download all information from the Shops access point (see below), including all images.2. The App will cache everything locally: images, data, etc. Even images of the maps.3. Cache is never invalidated, so once everything has been saved, set a flag and never ever access to the network again.4. If there's no Internet connection a message will be shown to the user.5. While caching the App will show an Activity indicator or other loader. Until you finish caching you don't get to the Main menu.6. The app will have a main menu screen where we'll add one button & a logo. The button takes us to the list of shops.7. The list of Shops will show in the upper 50% screen a map with one pin for each shop.8. The list of Shops will show in the lower 50% screen. Logo to the left, background image taking all the row, shop name in the front. Tapping a row takes us to the detail shop screen.9. All info should be read from a Core Data database.10. If you tap on a pin in the map a callout will open.shop name. Taping the callout takes us to the detail shop screen.11. The map will be always centered in madrid, showing also the user location.12. All data is at least in Spanish & English: should cache all and display in Spanish (if that's our phone's language) or English otherwise.13. Shop detail screen should show shop name, description, address, and a map showing the shops's location without any pin.

## Extra Requirements
1. Use a git repository to track your code as you go along.
2. To persist information while you're offline use Core Data.
3. You can cache the images using any technique you like (CoreData, a library, archiving files, etc.)
4. Clean architecture would be nice: interactors, managers, etc.
5. Test: model, DAOs.

## Web services
URL MapCache API
>"https://maps.googleapis.com/maps/api/staticmap?%25&size=320x220&scale=2&markers="

[URL Shops API] (https://madrid-shops.com/json_new/getShops.php)

[URL Activities API] (https://madrid-shops.com/json_new/getActivities.php)

## Technologies
* Xcode 9
* Swift 4
* CoreData
* Mapkits & Corelocation
* Autolayout

---

## Structure
* ***String+Language.swift:*** a methods collection to print a text according to the *deviceLanguage*.

```swift
mutating func setShopTitleLanguage() {
	if deviceLanguage() == DeviceLanguageTypes.es {
		self = "Tiendas"
    } else {
       self = "Shops"
    }
}
```

* ***DeviceLanguage.swift:*** a methods collection that control and return controlled languages types. Spanish (default) and English.

```swift
public enum DeviceLanguageTypes {
    case en, es
}
```

```swift
func deviceLanguage() -> DeviceLanguageTypes {
    let defaults = UserDefaults.standard
    let language = defaults.string(forKey: "language")
    
    switch language {
    case "es"?:
        return DeviceLanguageTypes.es
    case "en"?:
        return DeviceLanguageTypes.en
    default:
        return giveMeLanguageTypeFrom(Locale.current.languageCode)
    }
}
```

* ***UserSettingsInteractor.swift:*** UserDefaults methods that controlls app language and saved cache data.

```swift
func executedOnceAlready() {
	let defaults = UserDefaults.standard
        
	let dateSaved = Date()
	let formatter = DateFormatter()
	formatter.locale = Locale(identifier: "es_ES")
	formatter.dateFormat = "dd-MM-yyyy HH:mm"
	let dateString = formatter.string(from: dateSaved)
        
	defaults.set(dateString, forKey: "lastUpdate")
	defaults.set(true, forKey: "saved")
        
	defaults.synchronize()
}
```

## Extra Features
* ***MenuOptions Chapter:*** a files collection that contains a few configurations options like select app language or review the last cache update.
* ***Show User Location Button:*** this button show the user location and center the map on him until button is pressed again.
* ***Scroll View:*** a scroll view to show all shop details.
* ***Reload button:*** a reload button appears when conexion or download fails. This button reload all data again.

## Bugs reported

* ***DownloadData Button on OptionsMenu:*** this button remove the cache and download again all data from api url. But you need to reload the app to be able to see the new downloaded data.

---
###### *Copyright © 2017 Miguel Jardón. All rights reserved.*