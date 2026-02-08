import SwiftUI

struct AddCategoryView: View {

    @Environment(\.dismiss) var dismiss

    @State private var categoryName: String = ""

    let themeRed = Color(red: 248/255, green: 95/255, blue: 106/255)

    var body: some View {
        VStack(alignment: .leading, spacing: 30) {

            Button(action: { dismiss() }) {
                Image(systemName: "arrow.left")
                    .foregroundColor(themeRed)
                    .font(.title2)
            }
            .padding(.top)

            Text("Add Category")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color(red: 0.1, green: 0.2, blue: 0.3))

            VStack(alignment: .leading, spacing: 8) {
                Text("Category Name")
                    .foregroundColor(themeRed)
                    .fontWeight(.semibold)

                TextField("Enter category name here", text: $categoryName)
                    .textFieldStyle(PlainTextFieldStyle())

                Divider()
            }

            Spacer()

            Button(action: {
                // saving logic will go here later
                dismiss()
            }) {
                Text("Save Category")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(themeRed)
                    .cornerRadius(10)
            }
            .padding(.bottom, 20)

        }
        .padding(.horizontal, 25)
        .navigationBarHidden(true)
    }
}

struct AddCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        AddCategoryView()
    }
}
