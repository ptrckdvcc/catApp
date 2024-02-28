//
//  ErrorAlert.swift
//  Cats
//
//  Created by Patrick Diviacco on 27/02/2024.
//

import SwiftUI

struct ErrorAlert: ViewModifier {
    // MARK: - Properties
    @Binding var error: APIError?
    var retry: ()->()
    var dismiss: ()->()
    
    var isShowing: Binding<Bool> {
         Binding {
             error != nil
         } set: { _ in
             error = nil
         }
     }
    
    // MARK: - Body
    func body(content: Content) -> some View {
            content
                .alert(error?.message ?? "Generic error", isPresented: isShowing) {
                    Button("Retry") { retry() }
                    Button("Dismiss") { dismiss() }
                }
        }
}

extension View {
    func errorAlert(_ error: Binding<APIError?>,
                    retry: @escaping ()->(),
                    dismiss: @escaping ()->()) -> some View {
        
        modifier(ErrorAlert(error: error, retry: retry, dismiss: dismiss))
    }
}
