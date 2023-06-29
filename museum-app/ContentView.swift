//
//  ContentView.swift
//  museum-app
//
//  Created by Cordova  on 26/06/23.
//

import SwiftUI
import RealityKit
import RealityKitContent

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    let categories = [
        Category(id: 1, name: "Europe", exhibits: [
            Exhibit(title: "Pottery", description: "Pottery was a significant aspect of ancient Greek life and culture, and it played an important role in various aspects of society, including religion, daily life, and trade. Greek pottery was typically made of clay and was decorated with intricate designs and scenes that depicted various aspects of life in ancient Greece\n\nOne of the most famous styles of Greek pottery is known as black-figure pottery, which was prevalent from the 7th to the 5th centuries BCE. This style was characterized by black figures painted on a reddish-orange background, and it was used to depict various scenes from Greek mythology. One of the most famous examples of black-figure pottery is the François Vase, which dates back to the 6th century BCE and is now housed in the Archaeological Museum of Florence\n\nAnother popular style of Greek pottery is known as red-figure pottery, which emerged in the late 6th century BCE. This style was characterized by red figures painted on a black background, and it allowed for more detailed and intricate designs. The red-figure technique was used to depict various scenes from daily life, as well as mythological scenes and other subjects. One of the most famous examples of red-figure pottery is the Euphronios krater, which dates back to the 5th century BCE and is now housed in the Metropolitan Museum of Art in New York"),
            Exhibit(title: "Statue", description: "Sculpture has a long and rich history in Europe, dating back to ancient times. From the ancient Greeks to the Renaissance masters to contemporary artists, European sculpture has played an important role in the art world and has influenced countless artists throughout history\n\nOne of the most famous periods of European sculpture is the Renaissance, which began in Italy in the 14th century and spread throughout Europe. During this time, artists such as Michelangelo, Donatello, and Leonardo da Vinci created some of the most iconic sculptures in history, including Michelangelo's David and Donatello's Saint George and the Dragon. Renaissance sculpture was characterized by a focus on realism and human anatomy, as well as a revival of classical themes and motifs\n\nIn addition to the Renaissance, European sculpture has also been influenced by various other styles and movements throughout history. For example, Baroque sculpture emerged in the 17th century and was characterized by a dramatic and theatrical style, as well as a focus on movement and emotion. This style is exemplified by works such as Gian Lorenzo Bernini's Ecstasy of Saint Teresa and Antonio Canova's The Three Graces.")
        ]),
        Category(id: 2, name: "Asia", exhibits: [
            Exhibit(title: "Pottery", description: "Pottery was a significant aspect of ancient Greek life and culture, and it played an important role in various aspects of society, including religion, daily life, and trade. Greek pottery was typically made of clay and was decorated with intricate designs and scenes that depicted various aspects of life in ancient Greece\n\nOne of the most famous styles of Greek pottery is known as black-figure pottery, which was prevalent from the 7th to the 5th centuries BCE. This style was characterized by black figures painted on a reddish-orange background, and it was used to depict various scenes from Greek mythology. One of the most famous examples of black-figure pottery is the François Vase, which dates back to the 6th century BCE and is now housed in the Archaeological Museum of Florence\n\nAnother popular style of Greek pottery is known as red-figure pottery, which emerged in the late 6th century BCE. This style was characterized by red figures painted on a black background, and it allowed for more detailed and intricate designs. The red-figure technique was used to depict various scenes from daily life, as well as mythological scenes and other subjects. One of the most famous examples of red-figure pottery is the Euphronios krater, which dates back to the 5th century BCE and is now housed in the Metropolitan Museum of Art in New York."),
            Exhibit(title: "Statue", description: "Sculpture has a long and rich history in Europe, dating back to ancient times. From the ancient Greeks to the Renaissance masters to contemporary artists, European sculpture has played an important role in the art world and has influenced countless artists throughout history\n\nOne of the most famous periods of European sculpture is the Renaissance, which began in Italy in the 14th century and spread throughout Europe. During this time, artists such as Michelangelo, Donatello, and Leonardo da Vinci created some of the most iconic sculptures in history, including Michelangelo's David and Donatello's Saint George and the Dragon. Renaissance sculpture was characterized by a focus on realism and human anatomy, as well as a revival of classical themes and motifs\n\nIn addition to the Renaissance, European sculpture has also been influenced by various other styles and movements throughout history. For example, Baroque sculpture emerged in the 17th century and was characterized by a dramatic and theatrical style, as well as a focus on movement and emotion. This style is exemplified by works such as Gian Lorenzo Bernini's Ecstasy of Saint Teresa and Antonio Canova's The Three Graces.")
        ]),
        Category(id: 3, name: "America", exhibits: [
            Exhibit(title: "Pottery", description: "Pottery was a significant aspect of ancient Greek life and culture, and it played an important role in various aspects of society, including religion, daily life, and trade. Greek pottery was typically made of clay and was decorated with intricate designs and scenes that depicted various aspects of life in ancient Greece\n\nOne of the most famous styles of Greek pottery is known as black-figure pottery, which was prevalent from the 7th to the 5th centuries BCE. This style was characterized by black figures painted on a reddish-orange background, and it was used to depict various scenes from Greek mythology. One of the most famous examples of black-figure pottery is the François Vase, which dates back to the 6th century BCE and is now housed in the Archaeological Museum of Florence\n\nAnother popular style of Greek pottery is known as red-figure pottery, which emerged in the late 6th century BCE. This style was characterized by red figures painted on a black background, and it allowed for more detailed and intricate designs. The red-figure technique was used to depict various scenes from daily life, as well as mythological scenes and other subjects. One of the most famous examples of red-figure pottery is the Euphronios krater, which dates back to the 5th century BCE and is now housed in the Metropolitan Museum of Art in New York."),
            Exhibit(title: "Statue", description: "Sculpture has a long and rich history in Europe, dating back to ancient times. From the ancient Greeks to the Renaissance masters to contemporary artists, European sculpture has played an important role in the art world and has influenced countless artists throughout history\n\nOne of the most famous periods of European sculpture is the Renaissance, which began in Italy in the 14th century and spread throughout Europe. During this time, artists such as Michelangelo, Donatello, and Leonardo da Vinci created some of the most iconic sculptures in history, including Michelangelo's David and Donatello's Saint George and the Dragon. Renaissance sculpture was characterized by a focus on realism and human anatomy, as well as a revival of classical themes and motifs\n\nIn addition to the Renaissance, European sculpture has also been influenced by various other styles and movements throughout history. For example, Baroque sculpture emerged in the 17th century and was characterized by a dramatic and theatrical style, as well as a focus on movement and emotion. This style is exemplified by works such as Gian Lorenzo Bernini's Ecstasy of Saint Teresa and Antonio Canova's The Three Graces.")
        ])
    ]
    @State var selectedExhibit: Exhibit?
    let realityKitContentBundle = Bundle.main
    
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    @State var showImmersiveSpace = false

    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    Section(header: Text(category.name)) {
                        ForEach(category.exhibits) { exhibit in
                            NavigationLink(destination: DetailView(exhibit: exhibit, bundle: realityKitContentBundle, scaleFactor: 1.5)) {
                                Text(exhibit.title)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Museum App")
            
            .overlay(
                Text("Prototype by Cordova")
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .padding(.top, 600)
            )
        }
    }
}

struct DetailView: View {
    let exhibit: Exhibit
    let bundle: Bundle
    let scaleFactor: CGFloat

    @State private var currentAngle: Angle = .degrees(0)
    @State private var finalAngle: Angle = .degrees(0)
    @State private var isRotating: Bool = false

    var body: some View {
        
        GeometryReader { geometry in
            HStack {
                Model3D(named: exhibit.title, bundle: bundle)
                    .scaleEffect(scaleFactor)
                    .frame(width: geometry.size.width / 2,
                           height: geometry.size.height)
                
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text(exhibit.title)
                            .font(.title)
                            .bold()
                        Text(exhibit.description)
                            .font(.system(size: 20))
                            .foregroundColor(.primary)
                        Spacer()
                    }
                    .padding()
                }
            }
            
            .navigationTitle(exhibit.title)
        }
    }
}

struct Exhibit: Identifiable {
    let id = UUID()
    let title: String
    let description: String
}

struct Category: Identifiable {
    let id: Int
    let name: String
    let exhibits: [Exhibit]
}



#Preview {
    ContentView()
}
