/// Available categories at https://api.mercadopago.com/item_categories
enum MPCategoryIdType {
  art,
  baby,
  coupons,
  donations,
  computing,
  cameras,
  videoGames,
  television,
  carElectronics,
  electronics,
  automotive,
  entertainment,
  fashion,
  games,
  home,
  musical,
  phones,
  services,
  learnings,
  tickets,
  travels,
  virtualGoods,
  others,
}

extension FromMPCategoryIdType on MPCategoryIdType {
  String get value {
    Map<MPCategoryIdType, String> fromMPCategoryIdType = {
      MPCategoryIdType.art: "art",
      MPCategoryIdType.baby: "baby",
      MPCategoryIdType.coupons: "coupons",
      MPCategoryIdType.donations: "donations",
      MPCategoryIdType.computing: "computing",
      MPCategoryIdType.cameras: "cameras",
      MPCategoryIdType.videoGames: "video_games",
      MPCategoryIdType.television: "television",
      MPCategoryIdType.carElectronics: "car_electronics",
      MPCategoryIdType.electronics: "electronics",
      MPCategoryIdType.automotive: "automotive",
      MPCategoryIdType.entertainment: "entertainment",
      MPCategoryIdType.fashion: "fashion",
      MPCategoryIdType.games: "games",
      MPCategoryIdType.home: "home",
      MPCategoryIdType.musical: "musical",
      MPCategoryIdType.phones: "phones",
      MPCategoryIdType.services: "services",
      MPCategoryIdType.learnings: "learnings",
      MPCategoryIdType.tickets: "tickets",
      MPCategoryIdType.travels: "travels",
      MPCategoryIdType.virtualGoods: "virtual_goods",
      MPCategoryIdType.others: "others",
    };
    return fromMPCategoryIdType[this]!;
  }

  String get description {
    Map<MPCategoryIdType, String> fromMPCategoryIdType = {
      MPCategoryIdType.art: "Collectibles & Art",
      MPCategoryIdType.baby:
          "Toys for Baby, Stroller, Stroller Accessories, Car Safety Seats",
      MPCategoryIdType.coupons: "Coupons",
      MPCategoryIdType.donations: "Donations",
      MPCategoryIdType.computing: "Computers & Tablets",
      MPCategoryIdType.cameras: "Cameras & Photography",
      MPCategoryIdType.videoGames: "Video Games & Consoles",
      MPCategoryIdType.television: "LCD, LED, Smart TV, Plasmas, TVs",
      MPCategoryIdType.carElectronics:
          "Car Audio, Car Alarm Systems & Security, Car DVRs, Car Video Players, Car PC",
      MPCategoryIdType.electronics: "Audio & Surveillance, Video & GPS, Others",
      MPCategoryIdType.automotive: "Parts & Accessories",
      MPCategoryIdType.entertainment:
          "Music, Movies & Series, Books, Magazines & Comics, Board Games & Toys",
      MPCategoryIdType.fashion:
          "Men's, Women's, Kids & baby, Handbags & Accessories, Health & Beauty, Shoes, Jewelry & Watches",
      MPCategoryIdType.games: "Online Games & Credits",
      MPCategoryIdType.home: "Home appliances. Home & Garden",
      MPCategoryIdType.musical: "Instruments & Gear",
      MPCategoryIdType.phones: "Cell Phones & Accessories",
      MPCategoryIdType.services: "General services",
      MPCategoryIdType.learnings: "Trainings, Conferences, Workshops",
      MPCategoryIdType.tickets:
          "Tickets for Concerts, Sports, Arts, Theater, Family, Excursions tickets, Events & more",
      MPCategoryIdType.travels:
          "Plane tickets, Hotel vouchers, Travel vouchers",
      MPCategoryIdType.virtualGoods:
          "E-books, Music Files, Software, Digital Images, PDF Files and any item which can be electronically stored in a file, Mobile Recharge, DTH Recharge and any Online Recharge",
      MPCategoryIdType.others: "Other categories",
    };
    return fromMPCategoryIdType[this]!;
  }
}
