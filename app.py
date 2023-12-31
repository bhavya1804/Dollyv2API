import torch
from transformers import AutoTokenizer, AutoModelForCausalLM
from fastapi import FastAPI

app = FastAPI()

# Load the model and tokenizer
model_name = "databricks/dolly-v2-3b"
tokenizer = AutoTokenizer.from_pretrained(model_name)
model = AutoModelForCausalLM.from_pretrained(model_name)

@app.post("/generate/")
async def generate_prompt(prompt: str, max_length: int = 50):
    input_ids = tokenizer.encode(prompt, return_tensors="pt")
    output = model.generate(input_ids, max_length=max_length)
    generated_text = tokenizer.decode(output[0], skip_special_tokens=True)
    return {"generated_text": generated_text}
