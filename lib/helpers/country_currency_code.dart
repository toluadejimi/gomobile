import '../models/countries.dart';

List<Country> getCountryCurrencyCode() {
  List<Map<String, String>> rawList = [
    {"name": "Afghanistan", "code": "AFN"},
    {"name": "Albania", "code": "ALL"},
    {"name": "Algeria", "code": "DZD"},
    {"name": "American Samoa", "code": "USD"},
    {"name": "Andorra", "code": "EUR"},
    {"name": "Angola", "code": "AOA"},
    {"name": "Anguilla", "code": "XCD"},
    {"name": "Antarctica", "code": "XCD"},
    {"name": "Antigua and Barbuda", "code": "XCD"},
    {"name": "Argentina", "code": "ARS"},
    {"name": "Armenia", "code": "AMD"},
    {"name": "Aruba", "code": "AWG"},
    {"name": "Australia", "code": "AUD"},
    {"name": "Austria", "code": "EUR"},
    {"name": "Azerbaijan", "code": "AZN"},
    {"name": "Bahamas", "code": "BSD"},
    {"name": "Bahrain", "code": "BHD"},
    {"name": "Bangladesh", "code": "BDT"},
    {"name": "Barbados", "code": "BBD"},
    {"name": "Belarus", "code": "BYR"},
    {"name": "Belgium", "code": "EUR"},
    {"name": "Belize", "code": "BZD"},
    {"name": "Benin", "code": "XOF"},
    {"name": "Bermuda", "code": "BMD"},
    {"name": "Bhutan", "code": "BTN"},
    {"name": "Bolivia", "code": "BOB"},
    {"name": "Bosnia and Herzegovina", "code": "BAM"},
    {"name": "Botswana", "code": "BWP"},
    {"name": "Bouvet Island", "code": "NOK"},
    {"name": "Brazil", "code": "BRL"},
    {"name": "British Indian Ocean Territory", "code": "USD"},
    {"name": "Brunei", "code": "BND"},
    {"name": "Bulgaria", "code": "BGN"},
    {"name": "Burkina Faso", "code": "XOF"},
    {"name": "Burundi", "code": "BIF"},
    {"name": "Cambodia", "code": "KHR"},
    {"name": "Cameroon", "code": "XAF"},
    {"name": "Canada", "code": "CAD"},
    {"name": "Cape Verde", "code": "CVE"},
    {"name": "Cayman Islands", "code": "KYD"},
    {"name": "Central African Republic", "code": "XAF"},
    {"name": "Chad", "code": "XAF"},
    {"name": "Chile", "code": "CLP"},
    {"name": "China", "code": "CNY"},
    {"name": "Christmas Island", "code": "AUD"},
    {"name": "Cocos (Keeling) Islands", "code": "AUD"},
    {"name": "Colombia", "code": "COP"},
    {"name": "Comoros", "code": "KMF"},
    {"name": "Congo", "code": "XAF"},
    {"name": "Cook Islands", "code": "NZD"},
    {"name": "Costa Rica", "code": "CRC"},
    {"name": "Croatia", "code": "EUR"},
    {"name": "Cuba", "code": "CUP"},
    {"name": "Cyprus", "code": "EUR"},
    {"name": "Czech Republic", "code": "CZK"},
    {"name": "Denmark", "code": "DKK"},
    {"name": "Djibouti", "code": "DJF"},
    {"name": "Dominica", "code": "XCD"},
    {"name": "Dominican Republic", "code": "DOP"},
    {"name": "East Timor", "code": "USD"},
    {"name": "Ecuador", "code": "ECS"},
    {"name": "Egypt", "code": "EGP"},
    {"name": "El Salvador", "code": "SVC"},
    {"name": "England", "code": "GBP"},
    {"name": "Equatorial Guinea", "code": "XAF"},
    {"name": "Eritrea", "code": "ERN"},
    {"name": "Estonia", "code": "EUR"},
    {"name": "Ethiopia", "code": "ETB"},
    {"name": "Falkland Islands", "code": "FKP"},
    {"name": "Faroe Islands", "code": "DKK"},
    {"name": "Fiji Islands", "code": "FJD"},
    {"name": "Finland", "code": "EUR"},
    {"name": "France", "code": "EUR"},
    {"name": "French Guiana", "code": "EUR"},
    {"name": "French Polynesia", "code": "XPF"},
    {"name": "French Southern territories", "code": "EUR"},
    {"name": "Gabon", "code": "XAF"},
    {"name": "Gambia", "code": "GMD"},
    {"name": "Georgia", "code": "GEL"},
    {"name": "Germany", "code": "EUR"},
    {"name": "Ghana", "code": "GHS"},
    {"name": "Gibraltar", "code": "GIP"},
    {"name": "Greece", "code": "EUR"},
    {"name": "Greenland", "code": "DKK"},
    {"name": "Grenada", "code": "XCD"},
    {"name": "Guadeloupe", "code": "EUR"},
    {"name": "Guam", "code": "USD"},
    {"name": "Guatemala", "code": "QTQ"},
    {"name": "Guinea", "code": "GNF"},
    {"name": "Guinea-Bissau", "code": "CFA"},
    {"name": "Guyana", "code": "GYD"},
    {"name": "Haiti", "code": "HTG"},
    {"name": "Heard Island and McDonald Islands", "code": "AUD"},
    {"name": "Holy See (Vatican City State)", "code": "EUR"},
    {"name": "Honduras", "code": "HNL"},
    {"name": "Hong Kong", "code": "HKD"},
    {"name": "Hungary", "code": "HUF"},
    {"name": "Iceland", "code": "ISK"},
    {"name": "India", "code": "INR"},
    {"name": "Indonesia", "code": "IDR"},
    {"name": "Iran", "code": "IRR"},
    {"name": "Iraq", "code": "IQD"},
    {"name": "Ireland", "code": "EUR"},
    {"name": "Israel", "code": "ILS"},
    {"name": "Italy", "code": "EUR"},
    {"name": "Ivory Coast", "code": "XOF"},
    {"name": "Jamaica", "code": "JMD"},
    {"name": "Japan", "code": "JPY"},
    {"name": "Jordan", "code": "JOD"},
    {"name": "Kazakhstan", "code": "KZT"},
    {"name": "Kenya", "code": "KES"},
    {"name": "Kiribati", "code": "AUD"},
    {"name": "Kuwait", "code": "KWD"},
    {"name": "Kyrgyzstan", "code": "KGS"},
    {"name": "Laos", "code": "LAK"},
    {"name": "Latvia", "code": "EUR"},
    {"name": "Lebanon", "code": "LBP"},
    {"name": "Lesotho", "code": "LSL"},
    {"name": "Liberia", "code": "LRD"},
    {"name": "Libyan Arab Jamahiriya", "code": "LYD"},
    {"name": "Liechtenstein", "code": "CHF"},
    {"name": "Lithuania", "code": "EUR"},
    {"name": "Luxembourg", "code": "EUR"},
    {"name": "Macau", "code": "MOP"},
    {"name": "North Macedonia", "code": "MKD"},
    {"name": "Madagascar", "code": "MGF"},
    {"name": "Malawi", "code": "MWK"},
    {"name": "Malaysia", "code": "MYR"},
    {"name": "Maldives", "code": "MVR"},
    {"name": "Mali", "code": "XOF"},
    {"name": "Malta", "code": "EUR"},
    {"name": "Marshall Islands", "code": "USD"},
    {"name": "Martinique", "code": "EUR"},
    {"name": "Mauritania", "code": "MRO"},
    {"name": "Mauritius", "code": "MUR"},
    {"name": "Mayotte", "code": "EUR"},
    {"name": "Mexico", "code": "MXN"},
    {"name": "Micronesia, Federated States of", "code": "USD"},
    {"name": "Moldova", "code": "MDL"},
    {"name": "Monaco", "code": "EUR"},
    {"name": "Mongolia", "code": "MNT"},
    {"name": "Montserrat", "code": "XCD"},
    {"name": "Morocco", "code": "MAD"},
    {"name": "Mozambique", "code": "MZN"},
    {"name": "Myanmar", "code": "MMR"},
    {"name": "Namibia", "code": "NAD"},
    {"name": "Nauru", "code": "AUD"},
    {"name": "Nepal", "code": "NPR"},
    {"name": "Netherlands", "code": "EUR"},
    {"name": "Netherlands Antilles", "code": "ANG"},
    {"name": "New Caledonia", "code": "XPF"},
    {"name": "New Zealand", "code": "NZD"},
    {"name": "Nicaragua", "code": "NIO"},
    {"name": "Niger", "code": "XOF"},
    {"name": "Nigeria", "code": "NGN"},
    {"name": "Niue", "code": "NZD"},
    {"name": "Norfolk Island", "code": "AUD"},
    {"name": "North Korea", "code": "KPW"},
    {"name": "Northern Ireland", "code": "GBP"},
    {"name": "Northern Mariana Islands", "code": "USD"},
    {"name": "Norway", "code": "NOK"},
    {"name": "Oman", "code": "OMR"},
    {"name": "Pakistan", "code": "PKR"},
    {"name": "Palau", "code": "USD"},
    {
      "name": "Palestine",
      "code": 'ILS',
    },
    {"name": "Palestine", "code": 'USD'},
    {"name": "Palestine", "code": 'JOD'},
    {"name": "Panama", "code": "PAB"},
    {"name": "Papua New Guinea", "code": "PGK"},
    {"name": "Paraguay", "code": "PYG"},
    {"name": "Peru", "code": "PEN"},
    {"name": "Philippines", "code": "PHP"},
    {"name": "Pitcairn Islands", "code": "NZD"},
    {"name": "Poland", "code": "PLN"},
    {"name": "Portugal", "code": "EUR"},
    {"name": "Puerto Rico", "code": "USD"},
    {"name": "Qatar", "code": "QAR"},
    {"name": "Reunion", "code": "EUR"},
    {"name": "Romania", "code": "RON"},
    {"name": "Russian Federation", "code": "RUB"},
    {"name": "Rwanda", "code": "RWF"},
    {"name": "Saint Helena", "code": "SHP"},
    {"name": "Saint Kitts and Nevis", "code": "XCD"},
    {"name": "Saint Lucia", "code": "XCD"},
    {"name": "Saint Pierre and Miquelon", "code": "EUR"},
    {"name": "Saint Vincent and the Grenadines", "code": "XCD"},
    {"name": "Samoa", "code": "WST"},
    {"name": "San Marino", "code": "EUR"},
    {"name": "Sao Tome and Principe", "code": "STD"},
    {"name": "Saudi Arabia", "code": "SAR"},
    {"name": "Scotland", "code": "GBP"},
    {"name": "Senegal", "code": "XOF"},
    {"name": "Serbia", "code": "RSD"},
    {"name": "Seychelles", "code": "SCR"},
    {"name": "Sierra Leone", "code": "SLL"},
    {"name": "Singapore", "code": "SGD"},
    {"name": "Slovakia", "code": "EUR"},
    {"name": "Slovenia", "code": "EUR"},
    {"name": "Solomon Islands", "code": "SBD"},
    {"name": "Somalia", "code": "SOS"},
    {"name": "South Africa", "code": "ZAR"},
    {"name": "South Georgia and the South Sandwich Islands", "code": "GBP"},
    {"name": "South Korea", "code": "KRW"},
    {"name": "South Sudan", "code": "SSP"},
    {"name": "Spain", "code": "EUR"},
    {"name": "Sri Lanka", "code": "LKR"},
    {"name": "Sudan", "code": "SDG"},
    {"name": "Suriname", "code": "SRD"},
    {"name": "Svalbard and Jan Mayen", "code": "NOK"},
    {"name": "Swaziland", "code": "SZL"},
    {"name": "Sweden", "code": "SEK"},
    {"name": "Switzerland", "code": "CHF"},
    {"name": "Syria", "code": "SYP"},
    {"name": "Tajikistan", "code": "TJS"},
    {"name": "Tanzania", "code": "TZS"},
    {"name": "Thailand", "code": "THB"},
    {"name": "The Democratic Republic of Congo", "code": "CDF"},
    {"name": "Togo", "code": "XOF"},
    {"name": "Tokelau", "code": "NZD"},
    {"name": "Tonga", "code": "TOP"},
    {"name": "Trinidad and Tobago", "code": "TTD"},
    {"name": "Tunisia", "code": "TND"},
    {"name": "Turkey", "code": "TRY"},
    {"name": "Turkmenistan", "code": "TMT"},
    {"name": "Turks and Caicos Islands", "code": "USD"},
    {"name": "Tuvalu", "code": "AUD"},
    {"name": "Uganda", "code": "UGX"},
    {"name": "Ukraine", "code": "UAH"},
    {"name": "United Arab Emirates", "code": "AED"},
    {"name": "United Kingdom", "code": "GBP"},
    {"name": "United States", "code": "USD"},
    {"name": "United States Minor Outlying Islands", "code": "USD"},
    {"name": "Uruguay", "code": "UYU"},
    {"name": "Uzbekistan", "code": "UZS"},
    {"name": "Vanuatu", "code": "VUV"},
    {"name": "Venezuela", "code": "VEF"},
    {"name": "Vietnam", "code": "VND"},
    {"name": "Virgin Islands, British", "code": "USD"},
    {"name": "Virgin Islands, U.S.", "code": "USD"},
    {"name": "Wales", "code": "GBP"},
    {"name": "Wallis and Futuna", "code": "XPF"},
    {"name": "Western Sahara", "code": "MAD"},
    {"name": "Yemen", "code": "YER"},
    {"name": "Zambia", "code": "ZMW"},
    {"name": "Zimbabwe", "code": "ZWD"}
  ];

  return rawList
      .map((e) =>
          Country(name: e['name'].toString(), code: e['code'].toString()))
      .toList();
}
