//
//  ContentView.swift
//  SwiftProjeto1
//
//  Created by Mihael Yuri Costa on 04/05/24.
//

import SwiftUI

struct ContentView: View {
    var emojiData = ["🐷", "🎅🏻", "📸", "🥶", "🤪", "😋"]
    var body: some View {
        VStack {
            Text("Jogo Da Memória Meu Verdão")
                .font(.subheadline)
            ScrollView{
                cardsGame(data: emojiData)
            }
            Button("Recomeçar"){
                
            }
        }.padding()
    }
    
    func cardsGame(data: [String]) -> some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<data.count,id: \.self){ item in
                Card(ativo: false, conteudo: emojiData[item]).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct Card: View {
    @State var ativo = false
    var conteudo = ""
    
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(conteudo)
                    .font(.largeTitle)
            }.opacity(ativo ? 1 : 0)
            
            base.opacity(ativo ? 0 : 1)
            
        }
        .foregroundColor(.green)
        .onTapGesture {
            ativo.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                ativo.toggle()
                }
        }
        
    }
}

#Preview {
    ContentView()
}
