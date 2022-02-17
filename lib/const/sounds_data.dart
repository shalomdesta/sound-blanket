class Data {
  String? icon;
  String? sound;
  String? name;

  Data({this.icon, this.sound, this.name});

  static List<Data> data = [
    Data(
        name: 'ציפורים',
        sound: 'lib/assets/sounds/birds.ogg',
        icon: 'lib/assets/icons/blanket-birds-symbolic.svg'),
    Data(
        name: 'סירה',
        sound: 'lib/assets/sounds/boat.ogg',
        icon: 'lib/assets/icons/blanket-boat-symbolic.svg'),
    Data(
        name: 'עיר',
        sound: 'lib/assets/sounds/city.ogg',
        icon: 'lib/assets/icons/blanket-city-symbolic.svg'),
    Data(
        name: 'בית קפה',
        sound: 'lib/assets/sounds/coffee-shop.ogg',
        icon: 'lib/assets/icons/blanket-coffee-shop-symbolic.svg'),
    Data(
        name: 'מדורה',
        sound: 'lib/assets/sounds/fireplace.ogg',
        icon: 'lib/assets/icons/blanket-fireplace-symbolic.svg'),
    Data(
        name: 'רעש ורוד',
        sound: 'lib/assets/sounds/pink-noise.ogg',
        icon: 'lib/assets/icons/blanket-pink-noise-symbolic.svg'),
    Data(
        name: 'גשם',
        sound: 'lib/assets/sounds/rain.ogg',
        icon: 'lib/assets/icons/blanket-rain-symbolic.svg'),
    Data(
        name: 'נחל',
        sound: 'lib/assets/sounds/stream.ogg',
        icon: 'lib/assets/icons/blanket-stream-symbolic.svg'),
    Data(
        name: 'לילה',
        sound: 'lib/assets/sounds/summer-night.ogg',
        icon: 'lib/assets/icons/blanket-summer-night-symbolic.svg'),
    Data(
        name: 'רכבת',
        sound: 'lib/assets/sounds/train.ogg',
        icon: 'lib/assets/icons/blanket-train-symbolic.svg'),
    Data(
        name: 'גלים',
        sound: 'lib/assets/sounds/waves.ogg',
        icon: 'lib/assets/icons/blanket-waves-symbolic.svg'),
    Data(
        name: 'רעש לבן',
        sound: 'lib/assets/sounds/white-noise.ogg',
        icon: 'lib/assets/icons/blanket-white-noise-symbolic.svg'),
    Data(
        name: 'רוח',
        sound: 'lib/assets/sounds/wind.ogg',
        icon: 'lib/assets/icons/blanket-wind-symbolic.svg'),
  ];
}
