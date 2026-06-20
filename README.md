# 🔒 Network Security - ML Intrusion Detection System

[![Python](https://img.shields.io/badge/Python-3.11-blue)](https://www.python.org/)
[![FastAPI](https://img.shields.io/badge/FastAPI-0.95-green)](https://fastapi.tiangolo.com/)
[![Docker](https://img.shields.io/badge/Docker-Deployed-blue)](https://www.docker.com/)
[![Live Demo](https://img.shields.io/badge/Live%20Demo-Render-brightgreen)](https://network-security-jxg9.onrender.com/docs)

---

## 📌 Project Overview

A machine learning-powered **Phishing URL Detection System** that classifies URLs as legitimate or phishing attempts. This full-stack application features a trained ML model, REST API backend, and MongoDB integration for data persistence. The model identifies potential phishing threats with 99.39% accuracy.

**Live API**: [https://network-security-jxg9.onrender.com/docs](https://network-security-jxg9.onrender.com/docs)

---

## 🎯 Features

- ✅ **Phishing URL Detection** - Binary classification of legitimate vs phishing URLs
- ✅ **REST API** - FastAPI with interactive Swagger UI documentation
- ✅ **ML Pipeline** - Data preprocessing, feature engineering, model training
- ✅ **Experiment Tracking** - MLflow integration with DagsHub for model versioning
- ✅ **Database Integration** - MongoDB for storing predictions and logs
- ✅ **Docker Ready** - Containerized deployment on Render
- ✅ **HTML Predictions** - View results in formatted table
- ✅ **Custom Exceptions** - Professional error handling

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    FastAPI Web Server                        │
│          (Uvicorn @ https://network-security.onrender.com)  │
└────┬──────────────────────────────────────────────┬──────────┘
     │                                              │
     ├─ /train (GET)         ──> Training Pipeline
     │                            ├─ Data Ingestion
     │                            ├─ Preprocessing
     │                            ├─ Feature Engineering
     │                            └─ Model Training
     │
     └─ /predict (POST)      ──> ML Model
                                 ├─ Preprocessor
                                 ├─ Random Forest Classifier
                                 └─ MongoDB Logger
                                 
┌──────────────────┐    ┌──────────────────┐    ┌──────────────┐
│    MongoDB       │    │   MLflow Tracker │    │   DagsHub    │
│  (Data Store)    │    │  (Experiments)   │    │  (Versioning)│
└──────────────────┘    └──────────────────┘    └──────────────┘
```

---

## 🛠️ Tech Stack

| Component | Technology |
|-----------|-----------|
| **Backend** | FastAPI, Uvicorn |
| **ML Framework** | scikit-learn, pandas, numpy |
| **Database** | MongoDB (Atlas) |
| **Experiment Tracking** | MLflow, DagsHub |
| **Deployment** | Docker, Render |
| **Containerization** | Docker, Docker Compose |
| **Python Version** | 3.11+ |

---

## 📊 Model Performance

| Metric | Value |
|--------|-------|
| **Dataset** | Phishing Detection Dataset |
| **Model** | Random Forest Classifier |
| **Accuracy** | **99.39%** |
| **Precision** | **98.86%** |
| **Recall** | **99.39%** |
| **F1-Score** | **99.13%** |
| **Training Time** | ~3-4 minutes |

**Dataset Info:**
- **File**: phishingData.csv
- **Classes**: Binary (0 = Legitimate, 1 = Phishing)
- **Features**: Network & URL-based features
  - having_IP_Address, URL_Length, Shortening_Service
  - having_At_Symbol, double_slash_redirecting
  - And 37+ other relevant features
- **Data Format**: Normalized numerical features (-1, 0, 1 values)

---

## 🚀 Live API Demo

### Try the API Now
Visit: **[https://network-security-jxg9.onrender.com/docs](https://network-security-jxg9.onrender.com/docs)**

### Available Endpoints

#### 1. **Train Model** (GET)
```
GET /train
```
Triggers the full ML training pipeline with latest phishing data.

**Response:**
```json
{
  "message": "Training is successful"
}
```

#### 2. **Make Predictions** (POST)
```
POST /predict
```
Upload a CSV file with phishing dataset features and get real-time predictions.

**Input**: CSV file with phishing features (having_IP_Address, URL_Length, etc.)

**Response**: HTML table with predictions (0 = Legitimate, 1 = Phishing URL)

---

## 📥 Installation & Setup

### Prerequisites
- Python 3.11+
- Git
- Docker (optional)
- MongoDB Atlas account (free tier available)
- DagsHub account (free tier available)

### Local Setup

1. **Clone the Repository**
   ```bash
   git clone https://github.com/Deepa5270/network-security.git
   cd network-security
   ```

2. **Create Virtual Environment**
   ```bash
   python -m venv venv
   source venv/bin/activate  # On Windows: venv\Scripts\activate
   ```

3. **Install Dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Set Environment Variables**
   Create a `.env` file:
   ```
   MONGODB_URL_KEY=your_mongodb_connection_string
   MLFLOW_TRACKING_URI=https://dagshub.com/your_username/network-security.mlflow
   MLFLOW_TRACKING_USERNAME=your_username
   MLFLOW_TRACKING_PASSWORD=your_dagshub_token
   ```

5. **Run Locally**
   ```bash
   python app.py
   ```
   Visit: `http://localhost:8000/docs`

---

## 🐳 Docker Deployment

### Build Docker Image
```bash
docker build -t network-security:latest .
```

### Run Container Locally
```bash
docker run -p 8000:8000 \
  -e MONGODB_URL_KEY="your_connection_string" \
  -e MLFLOW_TRACKING_URI="your_mlflow_uri" \
  -e MLFLOW_TRACKING_USERNAME="your_username" \
  -e MLFLOW_TRACKING_PASSWORD="your_password" \
  network-security:latest
```

---

## ☁️ Production Deployment on Render

This project is deployed on **Render** (free tier).

### Deployment Steps:
1. Push code to GitHub
2. Go to [render.com](https://render.com)
3. Create New Web Service → Connect GitHub repository
4. Configure environment variables (as shown in `.env` section)
5. Deploy! ✅

**Live URL**: [https://network-security-jxg9.onrender.com](https://network-security-jxg9.onrender.com)

---

## 📈 MLflow Experiment Tracking

All model training experiments are logged in **MLflow** via **DagsHub**.

View experiments: [DagsHub - Network Security](https://dagshub.com/deepa7932praj/network-security.mlflow)

**Features Tracked:**
- Model hyperparameters
- Accuracy, precision, recall, F1-score
- Training time
- Feature importance
- Model artifacts

---

## 📂 Project Structure

```
network-security/
├── networksecurity/
│   ├── pipeline/
│   │   └── training_pipeline.py       # ML pipeline orchestration
│   ├── constant/
│   │   └── training_pipeline.py       # Configuration constants
│   ├── exception/
│   │   └── exception.py               # Custom exceptions
│   ├── logging/
│   │   └── logger.py                  # Logging configuration
│   └── utils/
│       ├── main_utils/
│       │   └── utils.py               # Utility functions
│       └── ml_utils/
│           └── model/
│               └── estimator.py       # Model wrapper class
├── final_model/
│   ├── preprocessor.pkl               # Fitted preprocessor (scaling, encoding)
│   └── model.pkl                      # Trained Random Forest model
├── templates/
│   └── table.html                     # HTML template for prediction results
├── app.py                             # FastAPI application
├── Dockerfile                         # Docker configuration
├── requirements.txt                   # Python dependencies
└── README.md                          # This file
```

---

## 🔄 ML Pipeline Workflow

### Data Ingestion
- Fetch data from MongoDB or CSV
- Handle missing values
- Remove duplicates

### Data Preprocessing
- Feature scaling (StandardScaler)
- Categorical encoding (LabelEncoder)
- Train-test split (80-20)

### Feature Engineering
- Select relevant features
- Handle class imbalance
- Statistical analysis

### Model Training
- Train Random Forest Classifier
- Hyperparameter tuning
- Cross-validation (5-fold)

### Model Evaluation
- Calculate accuracy, precision, recall, F1-score
- Confusion matrix
- ROC-AUC curve
- Save best model artifacts

### Deployment
- Save preprocessor & model as pickle files
- Load models in FastAPI endpoints
- Monitor predictions in MongoDB

---

## 📝 API Usage Examples

### Example 1: Train the Model
```bash
curl -X GET "https://network-security-jxg9.onrender.com/train"
```

### Example 2: Make a Prediction (using Python)
```python
import requests
import pandas as pd

# Create sample data
data = pd.read_csv("sample_network_data.csv")

# Send to API
with open("sample_network_data.csv", "rb") as f:
    response = requests.post(
        "https://network-security-jxg9.onrender.com/predict",
        files={"file": f}
    )

# View results
print(response.text)  # HTML table with predictions
```

---

## 🎓 Learning Outcomes

This project demonstrates:
- ✅ **End-to-End ML Pipeline** - Data to deployment
- ✅ **REST API Development** - FastAPI best practices
- ✅ **Database Integration** - MongoDB operations
- ✅ **MLOps** - Experiment tracking with MLflow
- ✅ **Cloud Deployment** - Docker + Render
- ✅ **Error Handling** - Custom exceptions
- ✅ **Version Control** - Git workflow

---

## 🤝 Contributing

Contributions are welcome! To contribute:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📄 License

This project is open source and available under the MIT License.

---

## 📧 Contact & Support

- **GitHub**: [@Deepa5270](https://github.com/Deepa5270)
- **Project Repo**: [network-security](https://github.com/Deepa5270/network-security)
- **Live Demo**: [Render Deployment](https://network-security-jxg9.onrender.com/docs)

---

## 🙏 Acknowledgments

- Dataset: Phishing URL Detection Dataset
- MLflow: Experiment tracking and model versioning
- DagsHub: Model versioning and experiment management
- FastAPI: Modern Python web framework
- Render: Cloud deployment platform
- scikit-learn: Machine learning algorithms

---

## 📚 Resources & References

- [FastAPI Documentation](https://fastapi.tiangolo.com/)
- [scikit-learn Machine Learning](https://scikit-learn.org/)
- [MLflow Tracking & Versioning](https://mlflow.org/)
- [MongoDB Atlas Database](https://www.mongodb.com/cloud/atlas)
- [Render Cloud Deployment](https://render.com/docs)
- [DagsHub MLOps Platform](https://dagshub.com/)

---

**Made with ❤️ by [Deepa5270](https://github.com/Deepa5270)**

Last Updated: June 20, 2026 | Deployed: Render ✅