import google.generativeai as genai
from config import Settings
settings = Settings()

class LLMService:
    def __init__(self):
        genai.configure(api_key = settings.GEMINI_API_KEY)
        self.model = genai.GenerativeModel("gemini-2.0-flash")
    def generate_response(self,query: str, search_results: list[dict]):
        #Content from web search:
        #ource 1: <url>
        #<Content>
        #Source 2: <url>
        #<Content>
        #Query:
        context_text = "\n\n".join([
            f"Source {i+1} {result['url']}:\n{result['content']}"
            for i, result in enumerate(search_results)
        ])

        full_prompt =f"""
        Content from web search:
        {context_text}
        Query:{query}
        please provie a comprehensive, detailed, well-cited accurate response using the above Context. Think and reason deeply. Ensure it answers the query the user is asking. Do not use your knowledge unitll it is very much needed.
        """

        response = self.model.generate_content(full_prompt,stream = True)
        
        for chunk in response:
            yield chunk.text