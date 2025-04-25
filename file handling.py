{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "100dc935-ab97-4993-93fc-d85824cd8cb4",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "{\n",
      " \"cells\": [\n",
      "  {\n",
      "   \"cell_type\": \"code\",\n",
      "   \"execution_count\": null,\n",
      "   \"id\": \"017403ad-ca20-4200-9e13-6137c8a14012\",\n",
      "   \"metadata\": {},\n",
      "   \"outputs\": [],\n",
      "   \"source\": [\n",
      "    \"greekforgreeks\\n\",\n",
      "    \"helloworld\\n\",\n",
      "    \"123456\"\n",
      "   ]\n",
      "  }\n",
      " ],\n",
      " \"metadata\": {\n",
      "  \"kernelspec\": {\n",
      "   \"display_name\": \"Python 3 (ipykernel)\",\n",
      "   \"language\": \"python\",\n",
      "   \"name\": \"python3\"\n",
      "  },\n",
      "  \"language_info\": {\n",
      "   \"codemirror_mode\": {\n",
      "    \"name\": \"ipython\",\n",
      "    \"version\": 3\n",
      "   },\n",
      "   \"file_extension\": \".py\",\n",
      "   \"mimetype\": \"text/x-python\",\n",
      "   \"name\": \"python\",\n",
      "   \"nbconvert_exporter\": \"python\",\n",
      "   \"pygments_lexer\": \"ipython3\",\n",
      "   \"version\": \"3.12.7\"\n",
      "  }\n",
      " },\n",
      " \"nbformat\": 4,\n",
      " \"nbformat_minor\": 5\n",
      "}\n",
      "\n"
     ]
    }
   ],
   "source": [
    "# Reading a File in Read Mode (r)\n",
    "file = open(\"greeks.txt\", \"r\")\n",
    "content = file.read()\n",
    "print(content)\n",
    "file.close()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "8dc787d8-0ca7-4693-87fb-daf85f871330",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "b'{\\n \"cells\": [\\n  {\\n   \"cell_type\": \"code\",\\n   \"execution_count\": null,\\n   \"id\": \"017403ad-ca20-4200-9e13-6137c8a14012\",\\n   \"metadata\": {},\\n   \"outputs\": [],\\n   \"source\": [\\n    \"greekforgreeks\\\\n\",\\n    \"helloworld\\\\n\",\\n    \"123456\"\\n   ]\\n  }\\n ],\\n \"metadata\": {\\n  \"kernelspec\": {\\n   \"display_name\": \"Python 3 (ipykernel)\",\\n   \"language\": \"python\",\\n   \"name\": \"python3\"\\n  },\\n  \"language_info\": {\\n   \"codemirror_mode\": {\\n    \"name\": \"ipython\",\\n    \"version\": 3\\n   },\\n   \"file_extension\": \".py\",\\n   \"mimetype\": \"text/x-python\",\\n   \"name\": \"python\",\\n   \"nbconvert_exporter\": \"python\",\\n   \"pygments_lexer\": \"ipython3\",\\n   \"version\": \"3.12.7\"\\n  }\\n },\\n \"nbformat\": 4,\\n \"nbformat_minor\": 5\\n}\\n'\n"
     ]
    }
   ],
   "source": [
    "# Reading a File in Binary Mode (rb)\n",
    "file = open(\"greeks.txt\", \"rb\")\n",
    "content = file.read()\n",
    "print(content)\n",
    "file.close()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "c6b1a91e-c246-43fc-b213-c8783b194b75",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Writing to a File in Write Mode (w)\n",
    "file = open(\"greeks.txt\", \"w\")\n",
    "file.write(\"Hello,World!\")\n",
    "file.close()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "9f33c059-633b-4e4a-a892-ad0e6c732f14",
   "metadata": {},
   "outputs": [],
   "source": [
    "# Writing to a File in Append Mode (a)\n",
    "file = open(\"greeks.txt\", \"a\")\n",
    "file.write(\"This will add this line\")\n",
    "file.close()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "5de2ef11-d13f-462d-993e-20ddb75a1c0c",
   "metadata": {},
   "outputs": [],
   "source": [
    "file = open(\"greeks.txt\", \"r\")\n",
    "# perform file operations\n",
    "file.close()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "0c02a0e8-8607-45c1-94dd-eec3ca7373a7",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Hello,World!This will add this line\n"
     ]
    }
   ],
   "source": [
    "with open(\"greeks.txt\", \"r\") as file:\n",
    "    content = file.read()\n",
    "    print(content)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "cb34b477-8396-49a2-ac38-c87dbb107b11",
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Hello,World!This will add this line\n"
     ]
    }
   ],
   "source": [
    "# Handling Exceptions When Closing a File\n",
    "try:\n",
    "    file = open(\"greeks.txt\", \"r\")\n",
    "    content = file.read()\n",
    "    print(content)\n",
    "finally:\n",
    "    file.close()"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3 (ipykernel)",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.12.7"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
