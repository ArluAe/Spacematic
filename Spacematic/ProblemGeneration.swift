//
//  ProblemGeneration.swift
//  Spacematic
//
//  Created by Charles-An on 10/04/2024.
//

import Foundation



func generateProblem(difficulty: String, score: Int, gameMode: String) -> (String, String) {
    switch gameMode {
    case "maths":
        
        var signs = ["+"].randomElement()
        var problem = ("0 + 0", "0")
        
        
        var value1 = 0
        var value2 = 0
        var value3 = 0
        
        switch difficulty {
            
        case "easy":
            
            signs = ["+", "-", "x"].randomElement()
            switch signs {
            case "+":
                switch score {
                case 0...50:
                    value1 = Int.random(in: 1...9)
                    value2 = Int.random(in: 1...9)
                case 51...150:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 1...9)
                case 151...500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 1...19)
                default:
                    value1 = Int.random(in: 1...99)
                    value2 = Int.random(in: 1...99)
                }
                problem = ("\(value1) + \(value2)", String(value1+value2))
            case "-":
                switch score {
                case 0...50:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...9)
                case 51...150:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 1...9)
                case 151...500:
                    value1 = Int.random(in: 20...59)
                    value2 = Int.random(in: 1...19)
                default:
                    value1 = Int.random(in: 60...99)
                    value2 = Int.random(in: 1...59)
                }
                problem = ("\(value1) - \(value2)", String(value1-value2))
            case "x":
                switch score {
                case 0...50:
                    value1 = Int.random(in: 1...9)
                    value2 = Int.random(in: 1...5)
                case 51...150:
                    value1 = Int.random(in: 1...9)
                    value2 = Int.random(in: 1...9)
                case 151...500:
                    value1 = Int.random(in: 1...19)
                    value2 = Int.random(in: 1...9)
                default:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 1...9)
                }
                problem = ("\(value1) x \(value2)", String(value1*value2))
            default:
                problem =  ("0 + 0", "0")
            }
            
        case "medium":

            signs = ["+", "-", "x"].randomElement()
            switch signs {
            case "+":
                switch score {
                case 0...150:
                    value1 = Int.random(in: 1...9)
                    value2 = Int.random(in: 1...9)
                    value3 = Int.random(in: 1...9)
                case 51...350:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...19)
                    value3 = Int.random(in: 1...19)
                case 151...1500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 1...19)
                default:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...59)
                    value3 = Int.random(in: 10...59)
                }
                problem = ("\(value1) + \(value2) + \(value3)", String(value1+value2+value3))
            case "-":
                switch score {
                case 0...150:
                    value1 = Int.random(in: 19...59)
                    value2 = Int.random(in: 1...9)
                    value3 = Int.random(in: 1...9)
                case 51...350:
                    value1 = Int.random(in: 29...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 1...9)
                case 151...1500:
                    value1 = Int.random(in: 39...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...19)
                default:
                    value1 = Int.random(in: 59...99)
                    value2 = Int.random(in: 20...29)
                    value3 = Int.random(in: 20...29)
                }
                
                problem = ("\(value1) - \(value2) - \(value3)", String(value1-value2-value3))
            case "x":
                switch score {
                case 0...150:
                    value1 = Int.random(in: 1...19)
                    value2 = Int.random(in: 1...9)
                case 51...350:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...9)
                case 151...1500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 1...19)
                default:
                    value1 = Int.random(in: 10...99)
                    value2 = Int.random(in: 10...59)
                }
                
                problem = ("\(value1) x \(value2)", String(value1*value2))
                /*case "÷":
                 value1 = Int.random(in: 1...9)
                 value2 = Int.random(in: 1...9)
                 problem = ("\(value1*value2) ÷ \(value2)", (value1*value2)/value2, playerScore)*/
            default:
                problem =  ("0 + 0", "0")
            }
            
        case "hard":

            signs = ["+", "-", "x", "complex"].randomElement()
            switch signs {
            case "+":
                
                switch score {
                case 0...250:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...19)
                case 51...750:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...19)
                    value3 = Int.random(in: 10...19)
                case 151...2500:
                    value1 = Int.random(in: 10...99)
                    value2 = Int.random(in: 10...59)
                    value3 = Int.random(in: 10...19)
                default:
                    value1 = Int.random(in: 10...99)
                    value2 = Int.random(in: 10...99)
                    value3 = Int.random(in: 10...59)
                }
                
                problem = ("\(value1) + \(value2) + \(value3)", String(value1+value2+value3))
            case "-":
                switch score {
                case 0...250:
                    value1 = Int.random(in: 20...39)
                    value2 = Int.random(in: 1...10)
                    value3 = Int.random(in: 1...9)
                case 51...750:
                    value1 = Int.random(in: 40...59)
                    value2 = Int.random(in: 1...20)
                    value3 = Int.random(in: 1...19)
                case 151...2500:
                    value1 = Int.random(in: 60...79)
                    value2 = Int.random(in: 10...30)
                    value3 = Int.random(in: 10...29)
                default:
                    value1 = Int.random(in: 60...99)
                    value2 = Int.random(in: 10...30)
                    value3 = Int.random(in: 10...29)
                }
                
                problem = ("\(value1) - \(value2) - \(value3)", String(value1-value2-value3))
            case "x":
                switch score {
                case 0...250:
                    value1 = Int.random(in: 10...19)
                    value2 = Int.random(in: 1...19)
                    
                case 51...750:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...19)
                    
                case 151...2500:
                    value1 = Int.random(in: 10...59)
                    value2 = Int.random(in: 10...59)
                    
                default:
                    value1 = Int.random(in: 29...99)
                    value2 = Int.random(in: 29...99)
                    
                }
                problem = ("\(value1) x \(value2)", String(value1*value2))
                /*case "÷":
                 value1 = Int.random(in: 10...99)
                 value2 = Int.random(in: 1...9)
                 problem = ("\(value1*value2) ÷ \(value1)", (value1*value2)/value1, playerScore)
                 case "square root":
                 value1 = Int.random(in: 0...16)
                 problem = ("√" + String(value1 * value1), value1, playerScore)*/
            case "complex":
                let complexSign = ["multiplication plus", "multiplication minus"].randomElement()!
                switch complexSign {
                    
                case "multiplication plus":
                    switch score {
                    case 0...250:
                        value1 = Int.random(in: 10...19)
                        value2 = Int.random(in: 1...9)
                        value3 = Int.random(in: 10...19)
                    case 51...750:
                        value1 = Int.random(in: 10...19)
                        value2 = Int.random(in: 10...19)
                        value3 = Int.random(in: 10...59)
                    case 151...2500:
                        value1 = Int.random(in: 10...59)
                        value2 = Int.random(in: 10...19)
                        value3 = Int.random(in: 10...99)
                    default:
                        value1 = Int.random(in: 10...59)
                        value2 = Int.random(in: 10...59)
                        value3 = Int.random(in: 10...99)
                    }
                    problem = (String(value1) + " x " + String(value2) + " + " + String(value3), String(value1 * value2 + value3))
                case "multiplication minus":
                    switch score {
                    case 0...250:
                        value1 = Int.random(in: 10...19)
                        value2 = Int.random(in: 1...9)
                        value3 = Int.random(in: 1...9)
                    case 51...750:
                        value1 = Int.random(in: 10...19)
                        value2 = Int.random(in: 10...19)
                        value3 = Int.random(in: 10...99)
                    case 151...2500:
                        value1 = Int.random(in: 10...59)
                        value2 = Int.random(in: 10...19)
                        value3 = Int.random(in: 10...99)
                    default:
                        value1 = Int.random(in: 10...59)
                        value2 = Int.random(in: 10...59)
                        value3 = Int.random(in: 10...99)
                    }
                    problem = (String(value1) + " x " + String(value2) + " - " + String(value3), String(value1 * value2 - value3))
                    /*case "division plus":
                     switch score {
                     case 0...250:
                     value1 = Int.random(in: 1...9)
                     value2 = Int.random(in: 1...9)
                     value3 = Int.random(in: 1...9)
                     case 51...750:
                     value1 = Int.random(in: 10...19)
                     value2 = Int.random(in: 1...19)
                     value3 = Int.random(in: 1...19)
                     case 151...2500:
                     value1 = Int.random(in: 10...59)
                     value2 = Int.random(in: 10...19)
                     value3 = Int.random(in: 1...19)
                     default:
                     value1 = Int.random(in: 10...59)
                     value2 = Int.random(in: 10...59)
                     value3 = Int.random(in: 10...59)
                     }
                     problem = (String(value1 * value2) + " ÷ " + String(value2) + " + " + String(value3), value1 + value3, playerScore)
                     case "division minus":
                     switch score {
                     case 0...250:
                     value1 = Int.random(in: 1...9)
                     value2 = Int.random(in: 1...9)
                     value3 = Int.random(in: 1...9)
                     case 51...750:
                     value1 = Int.random(in: 10...19)
                     value2 = Int.random(in: 1...19)
                     value3 = Int.random(in: 1...19)
                     case 151...2500:
                     value1 = Int.random(in: 10...59)
                     value2 = Int.random(in: 10...19)
                     value3 = Int.random(in: 1...19)
                     default:
                     value1 = Int.random(in: 10...59)
                     value2 = Int.random(in: 10...59)
                     value3 = Int.random(in: 10...59)
                     }
                     problem = (String(value1 * value2) + " ÷ " + String(value2) + " - " + String(value3), value1 - value3, playerScore)*/
                default:
                    problem =  ("0 + 0", "0")
                }
            default:
                problem =  ("0 + 0", "0")
            }
        default:
            problem =  ("0 + 0", "0")
        }
        return problem
    case "geography":
        var problem = ("error", "0")

        
        switch difficulty {
        case "easy":
            var randomIndex = Int.random(in: 0...countriesAndCapitalsTop40.count-1);

            return(countriesAndCapitalsTop40[randomIndex][0]+" "+countriesAndCapitalsTop40[randomIndex][1],countriesAndCapitalsTop40[randomIndex][2])
            
        case "medium":

            var randomIndex = Int.random(in: 0...mediumDifficultyCountriesAndCapitals.count-1);

            
            return(mediumDifficultyCountriesAndCapitals[randomIndex][0]+" "+mediumDifficultyCountriesAndCapitals[randomIndex][1],mediumDifficultyCountriesAndCapitals[randomIndex][2])
        case "hard":

            var randomIndex = Int.random(in: 0...countriesAndCapitalsTotal.count-1);

            
            return(countriesAndCapitalsTotal[randomIndex][0]+" "+countriesAndCapitalsTotal[randomIndex][1],countriesAndCapitalsTotal[randomIndex][2])
            default:
                problem =  ("0 + 0", "0")
            }

        
    default:
        return ("error","0")
    }
    return ("error","0")
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
    ["🇿🇦", "South Africa", "Pretoria"],
    ["🇿🇦", "South Africa", "Bloemfontein"],
    ["🇿🇦", "South Africa", "Cape Town"],
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
    ["🇧🇴", "Bolivia", "Sucre"],
    ["🇧🇴", "Bolivia", "La Paz"],
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
    ["🇲🇸", "Montserrat", "Plymouth"],
    ["🇲🇸", "Montserrat", "Brades"],
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
    //["🇦🇶", "Antarctica", "N/A (Various Research Stations)"],
    ["🇦🇸", "American Samoa", "Pago Pago"],
    ["🇦🇺", "Australia", "Canberra"],
    ["🇦🇽", "Åland Islands", "Mariehamn"],
    //["🇧🇻", "Bouvet Island", "N/A (Uninhabited)"],
    ["🇨🇨", "Cocos (Keeling) Islands", "West Island"],
    ["🇨🇰", "Cook Islands", "Avarua"],
    //["🇨🇵", "Clipperton Island", "N/A (Uninhabited)"],
    ["🇨🇽", "Christmas Island", "Flying Fish Cove"],
    //["🇩🇬", "Diego Garcia", "N/A (Military Base)"],
    ["🇫🇯", "Fiji", "Suva"],
    ["🇫🇲", "Federated States of Micronesia", "Palikir"],
    ["🇬🇱", "Greenland", "Nuuk"],
    ["🇬🇸", "South Georgia and the South Sandwich Islands", "King Edward Point"],
    ["🇬🇺", "Guam", "Hagåtña"],
    //["🇭🇲", "Heard Island and McDonald Islands", "N/A (Uninhabited)"],
    ["🇮🇨", "Canary Islands", "Las Palmas de Gran Canaria"],
    ["🇮🇨", "Canary Islands", "Santa Cruz de Tenerife"],
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
    //["🇺🇲", "United States Minor Outlying Islands", "N/A (Varies)"],
    ["🇻🇨", "Saint Vincent and the Grenadines", "Kingstown"],
    ["🇻🇺", "Vanuatu", "Port Vila"],
    ["🇼🇫", "Wallis and Futuna", "Mata-Utu"],
    ["🇼🇸", "Samoa", "Apia"],
    ["🇾🇹", "Mayotte", "Mamoudzou"]
]











let countriesAndCapitalsTotal = [
    
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
    ["🇿🇦", "South Africa", "Pretoria"],
    ["🇿🇦", "South Africa", "Bloemfontein"],
    ["🇿🇦", "South Africa", "Cape Town"],
    ["🇿🇲", "Zambia", "Lusaka"],
    ["🇿🇼", "Zimbabwe", "Harare"],
    ["🇦🇬", "Antigua and Barbuda", "Saint John's"],
    ["🇦🇮", "Anguilla", "The Valley"],
    ["🇦🇷", "Argentina", "Buenos Aires"],
    ["🇦🇼", "Aruba", "Oranjestad"],
    ["🇧🇧", "Barbados", "Bridgetown"],
    ["🇧🇱", "Saint Barthélemy", "Gustavia"],
    ["🇧🇲", "Bermuda", "Hamilton"],
    ["🇧🇴", "Bolivia", "Sucre"],
    ["🇧🇴", "Bolivia", "La Paz"],
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
    ["🇲🇸", "Montserrat", "Plymouth"],
    ["🇲🇸", "Montserrat", "Brades"],
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
    ["🇻🇮", "U.S. Virgin Islands", "Charlotte Amalie"],
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
    ["🇾🇪", "Yemen", "Sana'a"],
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
    ["🇦🇨", "Ascension Island", "Georgetown"],
    //["🇦🇶", "Antarctica", "N/A (Various Research Stations)"],
    ["🇦🇸", "American Samoa", "Pago Pago"],
    ["🇦🇺", "Australia", "Canberra"],
    ["🇦🇽", "Åland Islands", "Mariehamn"],
    //["🇧🇻", "Bouvet Island", "N/A (Uninhabited)"],
    ["🇨🇨", "Cocos (Keeling) Islands", "West Island"],
    ["🇨🇰", "Cook Islands", "Avarua"],
    //["🇨🇵", "Clipperton Island", "N/A (Uninhabited)"],
    ["🇨🇽", "Christmas Island", "Flying Fish Cove"],
    //["🇩🇬", "Diego Garcia", "N/A (Military Base)"],
    ["🇫🇯", "Fiji", "Suva"],
    ["🇫🇲", "Federated States of Micronesia", "Palikir"],
    ["🇬🇱", "Greenland", "Nuuk"],
    ["🇬🇸", "South Georgia and the South Sandwich Islands", "King Edward Point"],
    //df
    ["🇬🇺", "Guam", "Hagåtña"],
    //["🇭🇲", "Heard Island and McDonald Islands", "N/A (Uninhabited)"],
    ["🇮🇨", "Canary Islands", "Las Palmas de Gran Canaria"],
    ["🇮🇨", "Canary Islands", "Santa Cruz de Tenerife"],
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
    //["🇺🇲", "United States Minor Outlying Islands", "N/A (Varies)"],
    ["🇻🇨", "Saint Vincent and the Grenadines", "Kingstown"],
    ["🇻🇺", "Vanuatu", "Port Vila"],
    ["🇼🇫", "Wallis and Futuna", "Mata-Utu"],
    ["🇼🇸", "Samoa", "Apia"],
    ["🇾🇹", "Mayotte", "Mamoudzou"]
]









let countriesAndCapitalsTop40 = [

    ["🇨🇳", "China", "Beijing"],
    ["🇮🇳", "India", "New Delhi"],
    ["🇺🇸", "United States", "Washington, D.C."],
    ["🇮🇩", "Indonesia", "Jakarta"],
    ["🇵🇰", "Pakistan", "Islamabad"],
    ["🇧🇷", "Brazil", "Brasília"],
    ["🇳🇬", "Nigeria", "Abuja"],
    ["🇧🇩", "Bangladesh", "Dhaka"],
    ["🇷🇺", "Russia", "Moscow"],
    ["🇲🇽", "Mexico", "Mexico City"],
    ["🇯🇵", "Japan", "Tokyo"],
    ["🇪🇹", "Ethiopia", "Addis Ababa"],
    ["🇵🇭", "Philippines", "Manila"],
    ["🇪🇬", "Egypt", "Cairo"],
    ["🇻🇳", "Vietnam", "Hanoi"],
    ["🇨🇩", "Democratic Republic of the Congo", "Kinshasa"],
    ["🇹🇷", "Turkey", "Ankara"],
    ["🇮🇷", "Iran", "Tehran"],
    ["🇩🇪", "Germany", "Berlin"],
    ["🇹🇭", "Thailand", "Bangkok"],
    ["🇬🇧", "United Kingdom", "London"],
    ["🇫🇷", "France", "Paris"],
    ["🇮🇹", "Italy", "Rome"],
    ["🇹🇿", "Tanzania", "Dodoma"],
    ["🇿🇦", "South Africa", "Pretoria"],
    ["🇿🇦", "South Africa", "Bloemfontein"],
    ["🇿🇦", "South Africa", "Cape Town"],
    ["🇲🇲", "Myanmar", "Naypyidaw"],
    ["🇰🇪", "Kenya", "Nairobi"],
    ["🇰🇷", "South Korea", "Seoul"],
    ["🇨🇴", "Colombia", "Bogotá"],
    ["🇪🇸", "Spain", "Madrid"],
    ["🇺🇬", "Uganda", "Kampala"],
    ["🇦🇷", "Argentina", "Buenos Aires"],
    ["🇩🇿", "Algeria", "Algiers"],
    ["🇸🇩", "Sudan", "Khartoum"],
    ["🇺🇦", "Ukraine", "Kyiv"],
    ["🇮🇶", "Iraq", "Baghdad"],
    ["🇦🇫", "Afghanistan", "Kabul"],
    ["🇵🇱", "Poland", "Warsaw"],
    ["🇨🇦", "Canada", "Ottawa"],
    ["🇲🇦", "Morocco", "Rabat"]
]








let mediumDifficultyCountriesAndCapitals = [
    ["🇦🇹", "Austria", "Vienna"],
    ["🇩🇪", "Germany", "Berlin"],
    ["🇬🇧", "United Kingdom", "London"],
    ["🇫🇷", "France", "Paris"],
    ["🇮🇹", "Italy", "Rome"],
    ["🇪🇸", "Spain", "Madrid"],
    ["🇺🇦", "Ukraine", "Kyiv"],
    ["🇵🇱", "Poland", "Warsaw"],
    ["🇷🇴", "Romania", "Bucharest"],
    ["🇳🇱", "Netherlands", "Amsterdam"],
    ["🇧🇪", "Belgium", "Brussels"],
    ["🇬🇷", "Greece", "Athens"],
    ["🇨🇿", "Czech Republic", "Prague"],
    ["🇵🇹", "Portugal", "Lisbon"],
    ["🇸🇪", "Sweden", "Stockholm"],
    ["🇭🇺", "Hungary", "Budapest"],
    ["🇧🇾", "Belarus", "Minsk"],
    ["🇦🇹", "Austria", "Vienna"],
    ["🇨🇭", "Switzerland", "Bern"],
    ["🇷🇸", "Serbia", "Belgrade"],
    ["🇨🇳", "China", "Beijing"],
    ["🇮🇳", "India", "New Delhi"],
    ["🇮🇩", "Indonesia", "Jakarta"],
    ["🇵🇰", "Pakistan", "Islamabad"],
    ["🇧🇩", "Bangladesh", "Dhaka"],
    ["🇷🇺", "Russia", "Moscow"], // Note: Geographically, parts of Russia are in Asia.
    ["🇯🇵", "Japan", "Tokyo"],
    ["🇵🇭", "Philippines", "Manila"],
    ["🇻🇳", "Vietnam", "Hanoi"],
    ["🇮🇷", "Iran", "Tehran"],
    ["🇹🇷", "Turkey", "Ankara"],
    ["🇹🇭", "Thailand", "Bangkok"],
    ["🇲🇲", "Myanmar", "Naypyidaw"],
    ["🇰🇷", "South Korea", "Seoul"],
    ["🇮🇶", "Iraq", "Baghdad"],
    ["🇦🇫", "Afghanistan", "Kabul"],
    ["🇸🇦", "Saudi Arabia", "Riyadh"],
    ["🇺🇿", "Uzbekistan", "Tashkent"],
    ["🇲🇾", "Malaysia", "Kuala Lumpur"],
    ["🇾🇪", "Yemen", "Sana'a"],
    ["🇺🇸", "United States", "Washington, D.C."],
    ["🇧🇷", "Brazil", "Brasília"],
    ["🇲🇽", "Mexico", "Mexico City"],
    ["🇨🇴", "Colombia", "Bogotá"],
    ["🇦🇷", "Argentina", "Buenos Aires"],
    ["🇨🇦", "Canada", "Ottawa"],
    ["🇵🇪", "Peru", "Lima"],
    ["🇻🇪", "Venezuela", "Caracas"],
    ["🇨🇱", "Chile", "Santiago"],
    ["🇪🇨", "Ecuador", "Quito"],
    ["🇬🇹", "Guatemala", "Guatemala City"],
    ["🇧🇴", "Bolivia", "Sucre"],
    ["🇧🇴", "Bolivia", "La Paz"],
    ["🇭🇹", "Haiti", "Port-au-Prince"],
    ["🇩🇴", "Dominican Republic", "Santo Domingo"],
    
    ["🇨🇺", "Cuba", "Havana"],
    ["🇭🇳", "Honduras", "Tegucigalpa"],
    ["🇳🇮", "Nicaragua", "Managua"],
    ["🇵🇾", "Paraguay", "Asunción"],
    ["🇸🇻", "El Salvador", "San Salvador"],
    ["🇨🇷", "Costa Rica", "San José"],
    ["🇳🇬", "Nigeria", "Abuja"],
    ["🇪🇬", "Egypt", "Cairo"],
    ["🇪🇹", "Ethiopia", "Addis Ababa"],
    ["🇨🇩", "Democratic Republic of the Congo", "Kinshasa"],
    ["🇹🇿", "Tanzania", "Dodoma"],
    ["🇸🇩", "Sudan", "Khartoum"],
    ["🇰🇪", "Kenya", "Nairobi"],
    ["🇩🇿", "Algeria", "Algiers"],
    ["🇺🇬", "Uganda", "Kampala"],
    ["🇲🇦", "Morocco", "Rabat"],
    ["🇦🇴", "Angola", "Luanda"],
    ["🇬🇭", "Ghana", "Accra"],
    ["🇲🇿", "Mozambique", "Maputo"],
    ["🇲🇬", "Madagascar", "Antananarivo"],
    ["🇨🇮", "Côte d'Ivoire", "Yamoussoukro"],
    ["🇨🇲", "Cameroon", "Yaoundé"],
    ["🇳🇪", "Niger", "Niamey"],
    ["🇧🇫", "Burkina Faso", "Ouagadougou"],
    ["🇲🇱", "Mali", "Bamako"],
    ["🇲🇼", "Malawi", "Lilongwe"],
    ["🇦🇺", "Australia", "Canberra"],
    ["🇵🇬", "Papua New Guinea", "Port Moresby"],
    ["🇳🇿", "New Zealand", "Wellington"],
    ["🇫🇯", "Fiji", "Suva"],
    ["🇸🇧", "Solomon Islands", "Honiara"],
    ["🇻🇺", "Vanuatu", "Port Vila"],
    ["🇳🇨", "New Caledonia", "Nouméa"],
    ["🇫🇷", "French Polynesia", "Papeete"],
    ["🇬🇺", "Guam", "Hagåtña"],
    ["🇰🇮", "Kiribati", "Tarawa"],
    ["🇼🇸", "Samoa", "Apia"],
    ["🇫🇲", "Micronesia", "Palikir"],
    ["🇹🇴", "Tonga", "Nukuʻalofa"],
    ["🇲🇵", "Northern Mariana Islands", "Saipan"],
    ["🇵🇼", "Palau", "Ngerulmud"],
    ["🇲🇭", "Marshall Islands", "Majuro"],
    ["🇦🇸", "American Samoa", "Pago Pago"],
    ["🇨🇰", "Cook Islands", "Avarua"],
    ["🇼🇫", "Wallis and Futuna", "Mata-Utu"],
    ["🇹🇻", "Tuvalu", "Funafuti"]
]






/*
func sizeOfText(word: String, type: String, gameMode: String) {
    var wordLength = word.count
    if gameMode == "geography" {
        if type == "answer" {
            if wordLength < 10 {
                answerLabel = 30
            } else if wordLength < 20 {
                answerLabel = 20
            } else {
                answerLabel = 10
            }
        }
    }
}*/
