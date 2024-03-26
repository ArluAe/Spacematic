//
//  Components.swift
//  Spacematic
//
//  Created by Charles-An on 04/02/2024.
//
// © 2024 Charles-Andrea GRAVIER. All rights reserved



import Foundation
import SpriteKit
import GameplayKit
import SwiftUI

// Game
    // Nodes
var player = SKSpriteNode()
var projectile = SKSpriteNode()
var enemy = SKSpriteNode()
var star = SKSpriteNode()
    // Labels
var scoreLabel = SKLabelNode()
var mainLabel = SKLabelNode()
    // Nodes Parameter
var playerSize = CGSize(width: 36*2+10, height: 58*2+10)
var projectileSize = CGSize(width: 10, height: 10)
//var enemySize = CGSize(width: Int.random(in: 40...80), height: Int.random(in: 40...80))
var starSize = CGSize()
    // Color
var offBlackColor = UIColor(red: 0.35, green: 0.25, blue: 0.45, alpha: 1.0)
var offWhiteColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
var greenColor = UIColor(red: 0.7, green: 1.0, blue: 0.2, alpha: 1)
var orangeCustomColor = UIColor.orange
    // Time Intervals
var fireProjectileRate = 0.2
var projectileSpeed = 0.9

var enemySpeed = 2.1
var enemySpawnRate = 0.5
var starSpeed = 1.1
    // Touch Location
var touchLocation = CGPoint()

// General
// var gameIsOver = false
//var isAlive = true
//var score = 0


var labelMain1 = SKLabelNode()
var labelMain2 = SKLabelNode()
var labelMain3 = SKLabelNode()
var circle1 = SKSpriteNode()
var circle2 = SKSpriteNode()
var circle3 = SKSpriteNode()
var problem = SKShapeNode()
var textProblem = SKLabelNode()

var nodesY = 1000
var nodesSpeed = 4.2
var nodesSpawnRate = 4.2

var totalNodes: [SKNode] = []








struct DifficultyBarView: View {
    @Binding var backColorD1: Color
    @Binding var backColorD2: Color
    @Binding var backColorD3: Color
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 80)
                    .foregroundColor(backColorD1)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 70)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD1 == .clear {
                    backColorD1 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD2 = .clear
                    backColorD3 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 80)
                    .foregroundColor(backColorD2)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 70)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                       
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD2 == .clear {
                    backColorD2 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD1 = .clear
                    backColorD3 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110, height: 80)
                    .foregroundColor(backColorD3)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100, height: 70)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorD3 == .clear {
                    backColorD3 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorD2 = .clear
                    backColorD1 = .clear
                }
            }
        }
    }
}

/*struct DifficultyBarView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyBarView()
    }
}*/





struct GameModeBarView: View {
    @Binding var backColorM1: Color
    @Binding var backColorM2: Color
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 110*(3/2), height: 80)
                    .foregroundColor(backColorM1)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100*(3/2), height: 70)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Text("🔢")
                        .font(.title)
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorM1 == .clear {
                    backColorM1 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorM2 = .clear
                }
            }
            
            ZStack {
                Rectangle()
                    .frame(width: 110*(3/2), height: 80)
                    .foregroundColor(backColorM2)
                    .cornerRadius(30)
                Rectangle()
                    .frame(width: 100*(3/2), height: 70)
                    .foregroundColor(.purple)
                    .cornerRadius(30)
                HStack(spacing: 5) {
                    Text("🌍")
                        .font(.title)
                }
            }
            .padding(3)
            .onTapGesture {
                if backColorM2 == .clear {
                    backColorM2 = Color(red: 0.7, green: 1.0, blue: 0.2, opacity: 1)
                    backColorM1 = .clear
                }
            }
            
        }
    }
}
















let africansCountriesAndCapitals = [
    ["🇦🇴", "Angola", "Luanda"],
    ["🇧🇫", "Burkina Faso", "Ouagadougou"],
    ["🇧🇮", "Burundi", "Gitega"],
    ["🇧🇯", "Benin", "Porto-Novo"],
    ["🇧🇼", "Botswana", "Gaborone"],
    ["🇨🇩", "Democratic Republic of the Congo", "Kinshasa"],
    ["🇨🇫", "Central African Republic", "Bangui"],
    ["🇨🇬", "Republic of the Congo", "Brazzaville"],
    ["🇨🇮", "Côte d'Ivoire", "Yamoussoukro"],
    ["🇨🇲", "Cameroon", "Yaoundé"],
    ["🇨🇻", "Cape Verde", "Praia"],
    ["🇩🇯", "Djibouti", "Djibouti"],
    ["🇩🇿", "Algeria", "Algiers"],
    ["🇪🇬", "Egypt", "Cairo"],
    ["🇪🇭", "Western Sahara", "El Aaiún"],
    ["🇪🇷", "Eritrea", "Asmara"],
    ["🇪🇹", "Ethiopia", "Addis Ababa"],
    ["🇬🇦", "Gabon", "Libreville"],
    ["🇬🇭", "Ghana", "Accra"],
    ["🇬🇲", "The Gambia", "Banjul"],
    ["🇬🇳", "Guinea", "Conakry"],
    ["🇬🇶", "Equatorial Guinea", "Malabo"],
    ["🇬🇼", "Guinea-Bissau", "Bissau"],
    ["🇰🇪", "Kenya", "Nairobi"],
    ["🇰🇲", "Comoros", "Moroni"],
    ["🇱🇷", "Liberia", "Monrovia"],
    ["🇱🇸", "Lesotho", "Maseru"],
    ["🇱🇾", "Libya", "Tripoli"],
    ["🇲🇦", "Morocco", "Rabat"],
    ["🇲🇬", "Madagascar", "Antananarivo"],
    ["🇲🇱", "Mali", "Bamako"],
    ["🇲🇷", "Mauritania", "Nouakchott"],
    ["🇲🇺", "Mauritius", "Port Louis"],
    ["🇲🇼", "Malawi", "Lilongwe"],
    ["🇲🇿", "Mozambique", "Maputo"],
    ["🇳🇦", "Namibia", "Windhoek"],
    ["🇳🇪", "Niger", "Niamey"],
    ["🇳🇬", "Nigeria", "Abuja"],
    ["🇷🇼", "Rwanda", "Kigali"],
    ["🇸🇨", "Seychelles", "Victoria"],
    ["🇸🇩", "Sudan", "Khartoum"],
    ["🇸🇱", "Sierra Leone", "Freetown"],
    ["🇸🇳", "Senegal", "Dakar"],
    ["🇸🇴", "Somalia", "Mogadishu"],
    ["🇸🇸", "South Sudan", "Juba"],
    ["🇸🇿", "Eswatini", "Mbabane"],
    ["🇹🇩", "Chad", "N'Djamena"],
    ["🇹🇬", "Togo", "Lomé"],
    ["🇹🇳", "Tunisia", "Tunis"],
    ["🇹🇿", "Tanzania", "Dodoma"],
    ["🇺🇬", "Uganda", "Kampala"],
    ["🇿🇦", "South Africa", "Pretoria (executive), Bloemfontein (judicial), Cape Town (legislative)"],
    ["🇿🇲", "Zambia", "Lusaka"],
    ["🇿🇼", "Zimbabwe", "Harare"]
]


let americasCountriesAndCapitals = [
    ["🇦🇬", "Antigua and Barbuda", "Saint John's"],
    ["🇦🇮", "Anguilla", "The Valley"],
    ["🇦🇷", "Argentina", "Buenos Aires"],
    ["🇦🇼", "Aruba", "Oranjestad"],
    ["🇧🇧", "Barbados", "Bridgetown"],
    ["🇧🇱", "Saint Barthélemy", "Gustavia"],
    ["🇧🇲", "Bermuda", "Hamilton"],
    ["🇧🇴", "Bolivia", "Sucre (constitutional), La Paz (administrative)"],
    ["🇧🇶", "Bonaire, Sint Eustatius and Saba", "Kralendijk"],
    ["🇧🇷", "Brazil", "Brasília"],
    ["🇧🇸", "Bahamas", "Nassau"],
    ["🇧🇿", "Belize", "Belmopan"],
    ["🇨🇦", "Canada", "Ottawa"],
    ["🇨🇱", "Chile", "Santiago"],
    ["🇨🇴", "Colombia", "Bogotá"],
    ["🇨🇷", "Costa Rica", "San José"],
    ["🇨🇺", "Cuba", "Havana"],
    ["🇨🇼", "Curaçao", "Willemstad"],
    ["🇩🇲", "Dominica", "Roseau"],
    ["🇩🇴", "Dominican Republic", "Santo Domingo"],
    ["🇪🇨", "Ecuador", "Quito"],
    ["🇫🇰", "Falkland Islands", "Stanley"],
    ["🇬🇩", "Grenada", "St. George's"],
    ["🇬🇫", "French Guiana", "Cayenne"],
    ["🇬🇵", "Guadeloupe", "Basse-Terre"],
    ["🇬🇹", "Guatemala", "Guatemala City"],
    ["🇬🇾", "Guyana", "Georgetown"],
    ["🇭🇳", "Honduras", "Tegucigalpa"],
    ["🇭🇹", "Haiti", "Port-au-Prince"],
    ["🇯🇲", "Jamaica", "Kingston"],
    ["🇰🇳", "Saint Kitts and Nevis", "Basseterre"],
    ["🇰🇾", "Cayman Islands", "George Town"],
    ["🇱🇨", "Saint Lucia", "Castries"],
    ["🇲🇫", "Saint Martin (French part)", "Marigot"],
    ["🇲🇶", "Martinique", "Fort-de-France"],
    ["🇲🇸", "Montserrat", "Plymouth (de jure), Brades (de facto)"],
    ["🇲🇽", "Mexico", "Mexico City"],
    ["🇳🇮", "Nicaragua", "Managua"],
    ["🇵🇦", "Panama", "Panama City"],
    ["🇵🇪", "Peru", "Lima"],
    ["🇵🇲", "Saint Pierre and Miquelon", "Saint-Pierre"],
    ["🇵🇷", "Puerto Rico", "San Juan"],
    ["🇵🇾", "Paraguay", "Asunción"],
    ["🇸🇷", "Suriname", "Paramaribo"],
    ["🇸🇻", "El Salvador", "San Salvador"],
    ["🇸🇽", "Sint Maarten (Dutch part)", "Philipsburg"],
    ["🇹🇨", "Turks and Caicos Islands", "Cockburn Town"],
    ["🇹🇹", "Trinidad and Tobago", "Port of Spain"],
    ["🇺🇸", "United States", "Washington, D.C."],
    ["🇺🇾", "Uruguay", "Montevideo"],
    ["🇻🇪", "Venezuela", "Caracas"],
    ["🇻🇬", "British Virgin Islands", "Road Town"],
    ["🇻🇮", "U.S. Virgin Islands", "Charlotte Amalie"]
]


let asianCountriesAndCapitals = [
    ["🇦🇪", "United Arab Emirates", "Abu Dhabi"],
    ["🇦🇫", "Afghanistan", "Kabul"],
    ["🇦🇿", "Azerbaijan", "Baku"],
    ["🇧🇩", "Bangladesh", "Dhaka"],
    ["🇧🇭", "Bahrain", "Manama"],
    ["🇧🇳", "Brunei", "Bandar Seri Begawan"],
    ["🇧🇹", "Bhutan", "Thimphu"],
    ["🇨🇳", "China", "Beijing"],
    ["🇭🇰", "Hong Kong", "Hong Kong"],
    ["🇮🇩", "Indonesia", "Jakarta"],
    ["🇮🇱", "Israel", "Jerusalem"],
    ["🇮🇳", "India", "New Delhi"],
    ["🇮🇶", "Iraq", "Baghdad"],
    ["🇮🇷", "Iran", "Tehran"],
    ["🇯🇴", "Jordan", "Amman"],
    ["🇯🇵", "Japan", "Tokyo"],
    ["🇰🇬", "Kyrgyzstan", "Bishkek"],
    ["🇰🇭", "Cambodia", "Phnom Penh"],
    ["🇰🇵", "North Korea", "Pyongyang"],
    ["🇰🇷", "South Korea", "Seoul"],
    ["🇰🇼", "Kuwait", "Kuwait City"],
    ["🇰🇿", "Kazakhstan", "Nur-Sultan"],
    ["🇱🇦", "Laos", "Vientiane"],
    ["🇱🇧", "Lebanon", "Beirut"],
    ["🇱🇰", "Sri Lanka", "Sri Jayawardenepura Kotte"],
    ["🇲🇲", "Myanmar", "Naypyidaw"],
    ["🇲🇳", "Mongolia", "Ulaanbaatar"],
    ["🇲🇴", "Macau", "Macau"],
    ["🇲🇻", "Maldives", "Malé"],
    ["🇲🇾", "Malaysia", "Kuala Lumpur"],
    ["🇳🇵", "Nepal", "Kathmandu"],
    ["🇴🇲", "Oman", "Muscat"],
    ["🇵🇭", "Philippines", "Manila"],
    ["🇵🇰", "Pakistan", "Islamabad"],
    ["🇵🇸", "Palestine", "Jerusalem (East)"],
    ["🇶🇦", "Qatar", "Doha"],
    ["🇷🇺", "Russia", "Moscow"],
    ["🇸🇦", "Saudi Arabia", "Riyadh"],
    ["🇸🇬", "Singapore", "Singapore"],
    ["🇸🇾", "Syria", "Damascus"],
    ["🇹🇭", "Thailand", "Bangkok"],
    ["🇹🇯", "Tajikistan", "Dushanbe"],
    ["🇹🇱", "Timor-Leste", "Dili"],
    ["🇹🇲", "Turkmenistan", "Ashgabat"],
    ["🇹🇷", "Turkey", "Ankara"],
    ["🇹🇼", "Taiwan", "Taipei"],
    ["🇺🇿", "Uzbekistan", "Tashkent"],
    ["🇻🇳", "Vietnam", "Hanoi"],
    ["🇾🇪", "Yemen", "Sana'a"]
]


let europeansCountriesAndCapitals = [
    ["🇦🇩", "Andorra", "Andorra la Vella"],
    ["🇦🇱", "Albania", "Tirana"],
    ["🇦🇲", "Armenia", "Yerevan"],
    ["🇦🇹", "Austria", "Vienna"],
    ["🇧🇦", "Bosnia and Herzegovina", "Sarajevo"],
    ["🇧🇪", "Belgium", "Brussels"],
    ["🇧🇬", "Bulgaria", "Sofia"],
    ["🇧🇾", "Belarus", "Minsk"],
    ["🇨🇭", "Switzerland", "Bern"],
    ["🇨🇾", "Cyprus", "Nicosia"],
    ["🇨🇿", "Czech Republic", "Prague"],
    ["🇩🇪", "Germany", "Berlin"],
    ["🇩🇰", "Denmark", "Copenhagen"],
    ["🇪🇦", "Ceuta and Melilla", "Ceuta and Melilla"],
    ["🇪🇪", "Estonia", "Tallinn"],
    ["🇪🇸", "Spain", "Madrid"],
    ["🇪🇺", "European Union", "Brussels"],
    ["🇫🇮", "Finland", "Helsinki"],
    ["🇫🇷", "France", "Paris"],
    ["🇬🇧", "United Kingdom", "London"],
    ["🇬🇪", "Georgia", "Tbilisi"],
    ["🇬🇬", "Guernsey", "St. Peter Port"],
    ["🇬🇮", "Gibraltar", "Gibraltar"],
    ["🇬🇷", "Greece", "Athens"],
    ["🇭🇷", "Croatia", "Zagreb"],
    ["🇭🇺", "Hungary", "Budapest"],
    ["🇮🇪", "Ireland", "Dublin"],
    ["🇮🇲", "Isle of Man", "Douglas"],
    ["🇮🇸", "Iceland", "Reykjavik"],
    ["🇮🇹", "Italy", "Rome"],
    ["🇯🇪", "Jersey", "Saint Helier"],
    ["🇱🇮", "Liechtenstein", "Vaduz"],
    ["🇱🇹", "Lithuania", "Vilnius"],
    ["🇱🇺", "Luxembourg", "Luxembourg"],
    ["🇱🇻", "Latvia", "Riga"],
    ["🇲🇨", "Monaco", "Monaco"],
    ["🇲🇩", "Moldova", "Chisinau"],
    ["🇲🇪", "Montenegro", "Podgorica"],
    ["🇲🇰", "North Macedonia", "Skopje"],
    ["🇲🇹", "Malta", "Valletta"],
    ["🇳🇱", "Netherlands", "Amsterdam"],
    ["🇳🇴", "Norway", "Oslo"],
    ["🇵🇱", "Poland", "Warsaw"],
    ["🇵🇹", "Portugal", "Lisbon"],
    ["🇷🇴", "Romania", "Bucharest"],
    ["🇷🇸", "Serbia", "Belgrade"],
    ["🇷🇺", "Russia", "Moscow"],
    ["🇸🇪", "Sweden", "Stockholm"],
    ["🇸🇮", "Slovenia", "Ljubljana"],
    ["🇸🇰", "Slovakia", "Bratislava"],
    ["🇸🇲", "San Marino", "San Marino"],
    ["🇺🇦", "Ukraine", "Kyiv"],
    ["🇻🇦", "Vatican City", "Vatican City"],
    ["🇽🇰", "Kosovo", "Pristina"],
    // For non-standard regions or entities represented by the black flag emojis, you might need specific context or explanation, as they do not have ISO officially assigned flag emojis.
]


let oceaniaCountriesAndCapitals = [
    ["🇦🇨", "Ascension Island", "Georgetown"],
    ["🇦🇶", "Antarctica", "N/A (Various Research Stations)"],
    ["🇦🇸", "American Samoa", "Pago Pago"],
    ["🇦🇺", "Australia", "Canberra"],
    ["🇦🇽", "Åland Islands", "Mariehamn"],
    ["🇧🇻", "Bouvet Island", "N/A (Uninhabited)"],
    ["🇨🇨", "Cocos (Keeling) Islands", "West Island"],
    ["🇨🇰", "Cook Islands", "Avarua"],
    ["🇨🇵", "Clipperton Island", "N/A (Uninhabited)"],
    ["🇨🇽", "Christmas Island", "Flying Fish Cove"],
    ["🇩🇬", "Diego Garcia", "N/A (Military Base)"],
    ["🇫🇯", "Fiji", "Suva"],
    ["🇫🇲", "Federated States of Micronesia", "Palikir"],
    ["🇬🇱", "Greenland", "Nuuk"],
    ["🇬🇸", "South Georgia and the South Sandwich Islands", "King Edward Point"],
    ["🇬🇺", "Guam", "Hagåtña"],
    ["🇭🇲", "Heard Island and McDonald Islands", "N/A (Uninhabited)"],
    ["🇮🇨", "Canary Islands", "Las Palmas de Gran Canaria and Santa Cruz de Tenerife"],
    ["🇮🇴", "British Indian Ocean Territory", "Diego Garcia"],
    ["🇰🇮", "Kiribati", "Tarawa"],
    ["🇲🇭", "Marshall Islands", "Majuro"],
    ["🇲🇵", "Northern Mariana Islands", "Saipan"],
    ["🇳🇨", "New Caledonia", "Nouméa"],
    ["🇳🇫", "Norfolk Island", "Kingston"],
    ["🇳🇷", "Nauru", "Yaren District (de facto)"],
    ["🇳🇺", "Niue", "Alofi"],
    ["🇳🇿", "New Zealand", "Wellington"],
    ["🇵🇫", "French Polynesia", "Papeete"],
    ["🇵🇬", "Papua New Guinea", "Port Moresby"],
    ["🇵🇳", "Pitcairn Islands", "Adamstown"],
    ["🇵🇼", "Palau", "Ngerulmud"],
    ["🇷🇪", "Réunion", "Saint-Denis"],
    ["🇸🇧", "Solomon Islands", "Honiara"],
    ["🇸🇭", "Saint Helena", "Jamestown"],
    ["🇸🇯", "Svalbard and Jan Mayen", "Longyearbyen"],
    ["🇸🇹", "São Tomé and Príncipe", "São Tomé"],
    ["🇹🇦", "Tristan da Cunha", "Edinburgh of the Seven Seas"],
    ["🇹🇫", "French Southern and Antarctic Lands", "Port-aux-Français"],
    ["🇹🇰", "Tokelau", "Nukunonu, Atafu, and Fakaofo"],
    ["🇹🇴", "Tonga", "Nukuʻalofa"],
    ["🇹🇻", "Tuvalu", "Funafuti"],
    ["🇺🇲", "United States Minor Outlying Islands", "N/A (Varies)"],
    ["🇻🇨", "Saint Vincent and the Grenadines", "Kingstown"],
    ["🇻🇺", "Vanuatu", "Port Vila"],
    ["🇼🇫", "Wallis and Futuna", "Mata-Utu"],
    ["🇼🇸", "Samoa", "Apia"],
    ["🇾🇹", "Mayotte", "Mamoudzou"]
]
