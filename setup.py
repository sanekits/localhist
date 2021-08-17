from setuptools import setup, find_packages

setup(
    name='localhist',
    version='0.8.0',
    url='https://bbgithub.dev.bloomberg.com/lmatheson4/localhist',
    author='Les Matheson',
    author_email='lmatheson4@bloomberg.net',
    description='Description of my package',
    #packages=find_packages(),    
    py_modules = [ 'localhist' ],
    install_requires=[],
)

