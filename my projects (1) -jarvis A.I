import datetime
import wikipedia
import pyttsx3
import speech_recognition as sr
import webbrowser
import os
m = 0
# for voices in windows
engine = pyttsx3.init('sapi5')

# to get voices from windows
voices = engine.getProperty('voices')

engine.setProperty("voice", voices[0].id)  # selecting voice of male


def takecommand():
    global query
    r = sr.Recognizer()
    with sr.Microphone() as source:
        print('listening ...')
        r.pause_threshold = 1
        r.energy_threshold = 800
        audio = r.listen(source)

    try:
        print('recognizing...')
        query = r.recognize_google(audio, language='en-in')
        print(f'you said :{query}\n')
        speak(query)

    except Exception as e:
        print('can you please say that again')
        return "none"



def wish_me():
    hour = int(datetime.datetime.now().hour)
    if 0 <= hour < 12:
        print('good morning sir')
        speak('good morning sir')
    elif 12 <= hour < 18:
        print('good afternoon sir')
        speak('good afternoom sir')
    elif 18 <= hour < 24:
        print('good evening sir ')
        speak('good evening sir ')
    print('hello i am jarvis created by brijesh how may i help')
    speak(' i am jarvis created by brijesh how may i help')


def speak(audio):
    engine.say(audio)
    engine.runAndWait()


if __name__ == '__main__':
    wish_me()

while True:
    takecommand()
    if 'Wikipedia' in query:
        speak('searching on internet about this')
        query = query.replace('Wikipedia', "")
        result = wikipedia.summary(query, sentences=2)
        speak('according to my knowledge')
        print(result)
        speak(result)
    elif 'YouTube' in query:
        speak('opening youtube')
        webbrowser.open('youtube.com')
        query = ""
    elif 'Google' in query:
        speak('opening google')
        webbrowser.open('google.com')
        query = ""

    elif 'some not' in query :
        speak('ok close your door')
        webbrowser.open('naughtyamerica.com')
        query = ''
    elif 'stop' in query:
        speak('ok good bye sir have a nice day')
        print('quiting...')
        break
    elif 'music' in query:
        music_dir = 'c:\\music'
        songs = os.listdir(music_dir)
        speak('playing tokyo drift song on music app')
        os.startfile(os.path.join(music_dir,songs[0]))
        query = ''

    elif 'Deepak' in query:
        speak('deepak is a person like html is language and he is senior developer in microsoft with package '
              'of microsoft 365 account he learn python from naughtyamerica and wants to go to russia for russian'
              ' i mean russian technology and i know 1 day she will in google not in microsoft'
              ' currently he is not aavailable because he was with sir doing private session ')
        query = ''
    elif 'time' in query:
        strtime = datetime.datetime.now().strftime('%H:%M:%S')
        speak(f'sir the time is{strtime}')
        print(strtime)
        query = ''
    elif 'Chrome' in query:
        chrome = "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
        speak('opening chrome from deepaks laptop')
        os.startfile(chrome)
        query = ''
    elif 'who are you' in query:
        speak('i am jarvis i am hear to help you')
        query = ""
    elif 'game' in query:
        import random

        print("""
                this is a matchstick game between you and me
                First who will collect 24 matchstick he will win
                enter number from  1 to 4 to start
                """)
        speak("""
        this is a matchstick game between you and me
        First who will collect 24 matchstick he will win
        """)
        m_count = 0

        while True:
            usr = int(input('your move \n'))
            if usr < 5:
                m_count = m_count + usr
            else:
                print("your move was skipped because you entered value more than 4 ")
            print('matchsticks present are', '|' * m_count, m_count)
            if m_count >= 24:
                print('you win this game')
                speak('congrats you win this game ')
                break
            comp_move = random.randint(2, 4)
            m_count = comp_move + m_count
            speak(f'i choose{comp_move}')
            print('jarvis choosed ', comp_move)
            print('the score is ', '|' * m_count, m_count)
            speak(f'the score is {m_count}')
            if m_count >= 24:
                print('jarvis wins')
                speak('i win this game you cant defeat me i this game')
                break
            query =""

    elif 'joke' in query:
        speak('html is a programming language and'
              'deepak is a human')
        query = ''
    elif 'how are you' in query:
        print('i am fine thanks for asking')
        speak('i am fine thanks for asking')
        query = ''
    elif 'Brijesh' in query:
        speak('brijesh is the person who created me ')
        query =''
    elif 'good job' in query:
        speak('thanks sir')
    elif 'search' in query:
        query.replace('search','')
        webbrowser.open(query)
        query = ''
    elif 'Kapil' in query:
        speak('playing on youtube')
        play = 'https://www.youtube.com/watch?v=6zKyIO_0DGI'
        webbrowser.open(play)
        query = ''

    elif 'shut down' in query:
        os.system('shutdown /s /t 1')
