from flask import Flask, request, jsonify
import numpy as np
import pickle
import os

app = Flask(__name__)

# Load model once when the app starts
MODEL_PATH = os.path.join('/app/models', 'model.pkl')
model = None

def load_model():
    global model
    try:
        with open(MODEL_PATH, 'rb') as f:
            model = pickle.load(f)
    except Exception as e:
        print(f"Error loading model: {str(e)}")
        raise

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # Load model if not loaded
        if model is None:
            load_model()
            
        data = request.get_json()
        features = np.array(data['features'])
        prediction = model.predict(features)

        return jsonify({
            'prediction': prediction.tolist(),
            'status': 'success'
        })
    
    except Exception as e:
        return jsonify({'error': str(e)}), 400

@app.route('/health', methods=['GET'])
def health():
    return jsonify({'status': 'healthy'}), 200

if __name__ == '__main__':
    # Load model at startup
    load_model()
    app.run(host='0.0.0.0', port=8080)
