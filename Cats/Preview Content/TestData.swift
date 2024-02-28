//
//  TestData.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import Foundation


struct TestData {
    let model: Model
    let interactor: InteractorProtocol
    
    @MainActor
    init() {
        model = Model()
        model.cats = cats
        interactor = Interactor(model: model)
    }
    
    @MainActor
    static let shared = Self()
    
    let cat = Cat(id: "bomb",
                  name: "Bombai",
                  description: "The the golden eyes and the shiny black coa of the Bopmbay is absolutely striking. Likely to bond most with one family member, the Bombay will follow you from room to room and will almost always have something to say about what you are doing, loving attention and to be carried around, often on his caregiver's shoulder.",
                  image: Cat.Image(id: "7isAO4Cav",
                                   width: 960,
                                   height: 960,
                                   url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg"))
            
    let cats: [Cat] = [
            Cat(id: "bomb",
                name: "Bombai",
                description: "The the golden eyes and the shiny black coa of the Bopmbay is absolutely striking. Likely to bond most with one family member, the Bombay will follow you from room to room and will almost always have something to say about what you are doing, loving attention and to be carried around, often on his caregiver's shoulder.",
                image: Cat.Image(id: "7isAO4Cav",
                                 width: 960,
                                 height: 960,
                                 url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg")),
            
            Cat(id: "bsho",
                name: "British Shorthair",
                description: "The British Shorthair is a very pleasant cat to have as a companion, ans is easy going and placid. The British is a fiercely loyal, loving cat and will attach herself to every one of her family members. While loving to play, she doesn't need hourly attention. If she is in the mood to play, she will find someone and bring a toy to that person. The British also plays well by herself, and thus is a good companion for single people.",
                image: Cat.Image(id: "s4wQfYoEk",
                                 width: 1600,
                                 height: 1457,
                                 url: "https://cdn2.thecatapi.com/images/s4wQfYoEk.jpg")),
            
            Cat(id: "bure",
                name: "Burmese",
                description: "Burmese love being with people, playing with them, and keeping them entertained. They crave close physical contact and abhor an empty lap. They will follow their humans from room to room, and sleep in bed with them, preferably under the covers, cuddled as close as possible. At play, they will turn around to see if their human is watching and being entertained by their crazy antics.",
                image: Cat.Image(id: "4lXnnfxac",
                                 width: 1250,
                                 height: 650,
                                 url: "https://cdn2.thecatapi.com/images/4lXnnfxac.jpg")),
            
            Cat(id: "bomb",
                name: "Bombai",
                description: "The the golden eyes and the shiny black coa of the Bopmbay is absolutely striking. Likely to bond most with one family member, the Bombay will follow you from room to room and will almost always have something to say about what you are doing, loving attention and to be carried around, often on his caregiver's shoulder.",
                image: Cat.Image(id: "7isAO4Cav",
                                 width: 960,
                                 height: 960,
                                 url: "https://cdn2.thecatapi.com/images/7isAO4Cav.jpg")),
            
            Cat(id: "bsho",
                name: "British Shorthair",
                description: "The British Shorthair is a very pleasant cat to have as a companion, ans is easy going and placid. The British is a fiercely loyal, loving cat and will attach herself to every one of her family members. While loving to play, she doesn't need hourly attention. If she is in the mood to play, she will find someone and bring a toy to that person. The British also plays well by herself, and thus is a good companion for single people.",
                image: Cat.Image(id: "s4wQfYoEk",
                                 width: 1600,
                                 height: 1457,
                                 url: "https://cdn2.thecatapi.com/images/s4wQfYoEk.jpg")),
            
            Cat(id: "bure",
                name: "Burmese",
                description: "Burmese love being with people, playing with them, and keeping them entertained. They crave close physical contact and abhor an empty lap. They will follow their humans from room to room, and sleep in bed with them, preferably under the covers, cuddled as close as possible. At play, they will turn around to see if their human is watching and being entertained by their crazy antics.",
                image: Cat.Image(id: "4lXnnfxac",
                                 width: 1250,
                                 height: 650,
                                 url: "https://cdn2.thecatapi.com/images/4lXnnfxac.jpg"))
    ]
}
