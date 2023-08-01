class ProductReponse {
  Status status;
  String pageType;
  PlpResults plpResults;
  String nullSearch;

  ProductReponse({
    required this.status,
    required this.pageType,
    required this.plpResults,
    required this.nullSearch,
  });

  factory ProductReponse.fromJson(Map<String, dynamic> json) => ProductReponse(
        status: Status.fromJson(json["status"]),
        pageType: json["pageType"],
        plpResults: PlpResults.fromJson(json["plpResults"]),
        nullSearch: json["nullSearch"],
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "pageType": pageType,
        "nullSearch": nullSearch,
      };
}

class PlpResults {
  List<Record> records;

  PlpResults({
    required this.records,
  });

  factory PlpResults.fromJson(Map<String, dynamic> json) => PlpResults(
        records:
            List<Record>.from(json["records"].map((x) => Record.fromJson(x))),
      );
}

class MetaData {
  String searchAttributionToken;
  bool cached;
  int totalTime;

  MetaData({
    required this.searchAttributionToken,
    required this.cached,
    required this.totalTime,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        searchAttributionToken: json["searchAttributionToken"],
        cached: json["cached"],
        totalTime: json["totalTime"],
      );

  Map<String, dynamic> toJson() => {
        "searchAttributionToken": searchAttributionToken,
        "cached": cached,
        "totalTime": totalTime,
      };
}

class Navigation {
  List<Ancester> ancester;
  List<Ancester> current;
  List<dynamic> childs;

  Navigation({
    required this.ancester,
    required this.current,
    required this.childs,
  });

  factory Navigation.fromJson(Map<String, dynamic> json) => Navigation(
        ancester: List<Ancester>.from(
            json["ancester"].map((x) => Ancester.fromJson(x))),
        current: List<Ancester>.from(
            json["current"].map((x) => Ancester.fromJson(x))),
        childs: List<dynamic>.from(json["childs"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ancester": List<dynamic>.from(ancester.map((x) => x.toJson())),
        "current": List<dynamic>.from(current.map((x) => x.toJson())),
        "childs": List<dynamic>.from(childs.map((x) => x)),
      };
}

class Ancester {
  String label;
  String categoryId;

  Ancester({
    required this.label,
    required this.categoryId,
  });

  factory Ancester.fromJson(Map<String, dynamic> json) => Ancester(
        label: json["label"],
        categoryId: json["categoryId"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "categoryId": categoryId,
      };
}

class PlpState {
  String categoryId;
  String currentSortOption;
  String currentFilters;
  int firstRecNum;
  int lastRecNum;
  int recsPerPage;
  int totalNumRecs;
  String originalSearchTerm;
  PlpSellerName plpSellerName;
  String area;
  String id;

  PlpState({
    required this.categoryId,
    required this.currentSortOption,
    required this.currentFilters,
    required this.firstRecNum,
    required this.lastRecNum,
    required this.recsPerPage,
    required this.totalNumRecs,
    required this.originalSearchTerm,
    required this.plpSellerName,
    required this.area,
    required this.id,
  });

  factory PlpState.fromJson(Map<String, dynamic> json) => PlpState(
        categoryId: json["categoryId"],
        currentSortOption: json["currentSortOption"],
        currentFilters: json["currentFilters"],
        firstRecNum: json["firstRecNum"],
        lastRecNum: json["lastRecNum"],
        recsPerPage: json["recsPerPage"],
        totalNumRecs: json["totalNumRecs"],
        originalSearchTerm: json["originalSearchTerm"],
        plpSellerName: plpSellerNameValues.map[json["plpSellerName"]]!,
        area: json["area"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "categoryId": categoryId,
        "currentSortOption": currentSortOption,
        "currentFilters": currentFilters,
        "firstRecNum": firstRecNum,
        "lastRecNum": lastRecNum,
        "recsPerPage": recsPerPage,
        "totalNumRecs": totalNumRecs,
        "originalSearchTerm": originalSearchTerm,
        "plpSellerName": plpSellerNameValues.reverse[plpSellerName],
        "area": area,
        "id": id,
      };
}

enum PlpSellerName { DGL_INTERNACIONAL, LIVERPOOL, SUBURBIA, WILLIAMSSONOMA }

final plpSellerNameValues = EnumValues({
  "DGL Internacional": PlpSellerName.DGL_INTERNACIONAL,
  "liverpool": PlpSellerName.LIVERPOOL,
  "suburbia": PlpSellerName.SUBURBIA,
  "williamssonoma": PlpSellerName.WILLIAMSSONOMA
});

class Record {
  String productId;
  String skuRepositoryId;
  String productDisplayName;
  ProductType productType;
  PromotionalGiftMessage promotionalGiftMessage;
  double listPrice;
  double minimumListPrice;
  double maximumListPrice;
  double promoPrice;
  double minimumPromoPrice;
  double maximumPromoPrice;
  bool isHybrid;
  bool isMarketPlace;
  bool isImportationProduct;
  String? brand;
  PlpSellerName seller;
  String category;

  List<String> categoryBreadCrumbs;
  String? smImage;
  String? lgImage;
  String? xlImage;
  GroupType groupType;
  List<PlpFlag> plpFlags;
  List<VariantsColor>? variantsColor;

  Record({
    required this.productId,
    required this.skuRepositoryId,
    required this.productDisplayName,
    required this.productType,
    required this.promotionalGiftMessage,
    required this.listPrice,
    required this.minimumListPrice,
    required this.maximumListPrice,
    required this.promoPrice,
    required this.minimumPromoPrice,
    required this.maximumPromoPrice,
    required this.isHybrid,
    required this.isMarketPlace,
    required this.isImportationProduct,
    this.brand,
    required this.seller,
    required this.category,
    required this.categoryBreadCrumbs,
    this.smImage,
    this.lgImage,
    this.xlImage,
    required this.groupType,
    required this.plpFlags,
    required this.variantsColor,
  });

  factory Record.fromJson(Map<String, dynamic> json) => Record(
        productId: json["productId"],
        skuRepositoryId: json["skuRepositoryId"],
        productDisplayName: json["productDisplayName"],
        productType: productTypeValues.map[json["productType"]]!,
        promotionalGiftMessage:
            promotionalGiftMessageValues.map[json["promotionalGiftMessage"]]!,
        listPrice: json["listPrice"],
        minimumListPrice: json["minimumListPrice"],
        maximumListPrice: json["maximumListPrice"],
        promoPrice: json["promoPrice"]?.toDouble(),
        minimumPromoPrice: json["minimumPromoPrice"]?.toDouble(),
        maximumPromoPrice: json["maximumPromoPrice"]?.toDouble(),
        isHybrid: json["isHybrid"],
        isMarketPlace: json["isMarketPlace"],
        isImportationProduct: json["isImportationProduct"],
        brand: json["brand"],
        seller: plpSellerNameValues.map[json["seller"]]!,
        category: json["category"],
        categoryBreadCrumbs:
            List<String>.from(json["categoryBreadCrumbs"].map((x) => x)),
        smImage: json["smImage"],
        lgImage: json["lgImage"],
        xlImage: json["xlImage"],
        groupType: groupTypeValues.map[json["groupType"]]!,
        plpFlags: List<PlpFlag>.from(
            json["plpFlags"].map((x) => PlpFlag.fromJson(x))),
        variantsColor: json["variantsColor"] == null
            ? null
            : List<VariantsColor>.from(
                json["variantsColor"].map((x) => VariantsColor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "skuRepositoryId": skuRepositoryId,
        "productDisplayName": productDisplayName,
        "productType": productTypeValues.reverse[productType],
        "promotionalGiftMessage":
            promotionalGiftMessageValues.reverse[promotionalGiftMessage],
        "listPrice": listPrice,
        "minimumListPrice": minimumListPrice,
        "maximumListPrice": maximumListPrice,
        "promoPrice": promoPrice,
        "minimumPromoPrice": minimumPromoPrice,
        "maximumPromoPrice": maximumPromoPrice,
        "isHybrid": isHybrid,
        "isMarketPlace": isMarketPlace,
        "isImportationProduct": isImportationProduct,
        "brand": brand,
        "seller": plpSellerNameValues.reverse[seller],
        "category": category,
        "categoryBreadCrumbs":
            List<dynamic>.from(categoryBreadCrumbs.map((x) => x)),
        "smImage": smImage,
        "lgImage": lgImage,
        "xlImage": xlImage,
        "groupType": groupTypeValues.reverse[groupType],
        "plpFlags": List<dynamic>.from(plpFlags.map((x) => x.toJson())),
      };
}

class DwPromotionInfo {
  String dwToolTipInfo;
  DWPromoDescription dWPromoDescription;

  DwPromotionInfo({
    required this.dwToolTipInfo,
    required this.dWPromoDescription,
  });

  factory DwPromotionInfo.fromJson(Map<String, dynamic> json) =>
      DwPromotionInfo(
        dwToolTipInfo: json["dwToolTipInfo"],
        dWPromoDescription:
            dwPromoDescriptionValues.map[json["dWPromoDescription"]]!,
      );

  Map<String, dynamic> toJson() => {
        "dwToolTipInfo": dwToolTipInfo,
        "dWPromoDescription":
            dwPromoDescriptionValues.reverse[dWPromoDescription],
      };
}

enum DWPromoDescription {
  EMPTY,
  Y_O_RECIBE_STRONG_25_STRONG_EN_MONEDERO,
  Y_O_RECIBE_STRONG_30_STRONG_EN_MONEDERO
}

final dwPromoDescriptionValues = EnumValues({
  "": DWPromoDescription.EMPTY,
  "Y/o recibe <strong>25</strong>% en monedero":
      DWPromoDescription.Y_O_RECIBE_STRONG_25_STRONG_EN_MONEDERO,
  "Y/o recibe <strong>30</strong>% en monedero":
      DWPromoDescription.Y_O_RECIBE_STRONG_30_STRONG_EN_MONEDERO
});

enum GroupType { NOT_SPECIFIED }

final groupTypeValues = EnumValues({"Not Specified": GroupType.NOT_SPECIFIED});

class PlpFlag {
  String flagId;
  String flagMessage;

  PlpFlag({
    required this.flagId,
    required this.flagMessage,
  });

  factory PlpFlag.fromJson(Map<String, dynamic> json) => PlpFlag(
        flagId: json["flagId"],
        flagMessage: json["flagMessage"],
      );

  Map<String, dynamic> toJson() => {
        "flagId": flagId,
        "flagMessage": flagMessage,
      };
}

enum ProductType { SOFT_LINE }

final productTypeValues = EnumValues({"Soft Line": ProductType.SOFT_LINE});

enum PromotionalGiftMessage { NA }

final promotionalGiftMessageValues =
    EnumValues({"NA": PromotionalGiftMessage.NA});

class VariantsColor {
  String colorName;
  String colorHex;
  String colorImageUrl;
  String colorMainUrl;
  String skuId;

  VariantsColor({
    required this.colorName,
    required this.colorHex,
    required this.colorImageUrl,
    required this.colorMainUrl,
    required this.skuId,
  });

  factory VariantsColor.fromJson(Map<String, dynamic> json) => VariantsColor(
        colorName: json["colorName"],
        colorHex: json["colorHex"],
        colorImageUrl: json["colorImageURL"],
        colorMainUrl: json["colorMainURL"],
        skuId: json["skuId"],
      );

  Map<String, dynamic> toJson() => {
        "colorName": colorName,
        "colorHex": colorHex,
        "colorImageURL": colorImageUrl,
        "colorMainURL": colorMainUrl,
        "skuId": skuId,
      };
}

class RefinementGroup {
  String name;
  List<Refinement> refinement;
  bool multiSelect;
  String dimensionName;
  bool moreRefinements;

  RefinementGroup({
    required this.name,
    required this.refinement,
    required this.multiSelect,
    required this.dimensionName,
    required this.moreRefinements,
  });

  factory RefinementGroup.fromJson(Map<String, dynamic> json) =>
      RefinementGroup(
        name: json["name"],
        refinement: List<Refinement>.from(
            json["refinement"].map((x) => Refinement.fromJson(x))),
        multiSelect: json["multiSelect"],
        dimensionName: json["dimensionName"],
        moreRefinements: json["moreRefinements"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "refinement": List<dynamic>.from(refinement.map((x) => x.toJson())),
        "multiSelect": multiSelect,
        "dimensionName": dimensionName,
        "moreRefinements": moreRefinements,
      };
}

class Refinement {
  int count;
  String label;
  String refinementId;
  bool selected;
  Type type;
  SearchName? searchName;
  String? high;
  String? low;
  String? colorHex;

  Refinement({
    required this.count,
    required this.label,
    required this.refinementId,
    required this.selected,
    required this.type,
    this.searchName,
    this.high,
    this.low,
    this.colorHex,
  });

  factory Refinement.fromJson(Map<String, dynamic> json) => Refinement(
        count: json["count"],
        label: json["label"],
        refinementId: json["refinementId"],
        selected: json["selected"],
        type: typeValues.map[json["type"]]!,
        searchName: searchNameValues.map[json["searchName"]]!,
        high: json["high"],
        low: json["low"],
        colorHex: json["colorHex"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "label": label,
        "refinementId": refinementId,
        "selected": selected,
        "type": typeValues.reverse[type],
        "searchName": searchNameValues.reverse[searchName],
        "high": high,
        "low": low,
        "colorHex": colorHex,
      };
}

enum SearchName { CATEGORIES_1 }

final searchNameValues = EnumValues({"categories.1": SearchName.CATEGORIES_1});

enum Type { RANGE, VALUE }

final typeValues = EnumValues({"Range": Type.RANGE, "Value": Type.VALUE});

class SortOption {
  String sortBy;
  String label;

  SortOption({
    required this.sortBy,
    required this.label,
  });

  factory SortOption.fromJson(Map<String, dynamic> json) => SortOption(
        sortBy: json["sortBy"],
        label: json["label"],
      );

  Map<String, dynamic> toJson() => {
        "sortBy": sortBy,
        "label": label,
      };
}

class Status {
  String status;
  int statusCode;

  Status({
    required this.status,
    required this.statusCode,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "statusCode": statusCode,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
