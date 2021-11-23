import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    //UIOutlet
    @IBOutlet weak var firstnameTextField: UITextField!
    @IBOutlet weak var lastnameTextField: UITextField!
    @IBOutlet weak var phonenumeberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phonenumeberTextField.delegate = self
    }
    
    @IBAction func onClickRegister(_ sender: Any) {
        
        //Variables
        let firstname = firstnameTextField.text!
        let lastname = lastnameTextField.text!
        let phonenumber = phonenumeberTextField.text!
        let email = emailTextField.text!
        
        //Condicional
        if firstname.isEmpty || lastname.isEmpty || phonenumber.isEmpty || email.isEmpty {
            let alert = UIAlertController(title: "Alerta", message: "Complete correctamente los campos", preferredStyle: .alert)
            let alertButton = UIAlertAction(title: "Entendido", style: .cancel, handler: nil)
            alert.addAction(alertButton)
            present(alert, animated: true, completion: nil)
        } else {
            self.performSegue(withIdentifier: "signupnext", sender: nil)
            firstnameTextField.text! = ""
            lastnameTextField.text! = ""
            phonenumeberTextField.text! = ""
            emailTextField.text! = ""
        }
        
    }
    
    
    func checkMaxLength(textField: UITextField!, maxLength: Int) {
        if (textField.text!.count > maxLength) {
            textField.deleteBackward()
        }
    }
    
    //Max Length TextField
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 9
        let currentString: NSString = (textField.text ?? "") as NSString
        let newString: NSString =
            currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
}

