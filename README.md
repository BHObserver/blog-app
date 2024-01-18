# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 Decode Morse Code ](#-decode-morse-code-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)


# 📖 Blog-app <a name="about-project"></a>

The **Blog App** is crafted to function as a comprehensive blog website, offering users a seamless platform to discover a diverse catalog of articles. Its purpose is to facilitate user interaction through features such as commenting and expressing appreciation through post likes. The goal is to provide a fully functional web experience for users to engage with and enjoy the content available on the platform.

## 🛠 Built With <a name="built-with">Ruby</a>

### Tech Stack <a name="tech-stack"></a>
- **Ruby**
- **PostgreSql**



### Key Features <a name="key-features"></a>

- **Ruby on Rails**
- **Creating a data model**
- **Functional website**
- **Unit testing**
- **Database**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

> You need the following tools be installed in your computer:

> - [Rails](https://guides.rubyonrails.org/)
> - [Git](https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/)
> - [Ruby](https://github.com/microverseinc/curriculum-ruby/blob/main/simple-ruby/articles/ruby_installation_instructions.md)
> - IDE
> - Etc

### Setup

Clone this repository to your desired folder:

```sh
  cd my-prefered-folder
  
  git clone https://github.com/bhobserver/blog-app.git
```

### Install

Install this project with:

```sh
  cd Blog
  
  bundle install
```

### 💾 Database

Create the databases and run migrations with:

```sh
rails db:create
rails db:migrate
```

### Usage

To run the project, execute the following command:

```sh
  rails server or rails s
```

### Run tests

To run tests, run the following command:


```sh
  rspec spec/
```

## 📡 Using the API with Postman

To interact with the Blog App API using Postman, follow these steps:

### 1. Sign Up or Sign In to Obtain an Authentication Token

- **Sign Up:**
  - Make a `POST` request to `/api/v1/auth/sign_up`.
  - Include the necessary parameters (e.g., email, password) in the request body.
  - The response will include an authentication token.

- **Sign In:**
  - Make a `POST` request to `/api/v1/auth/sign_in`.
  - Include the necessary parameters (email, password) in the request body.
  - The response will include an authentication token.

### 2. Include Token in Headers

- For subsequent requests, include the obtained authentication token in the headers.
  - Add a header with key `Authorization` and value `Bearer YOUR_TOKEN`.

### 3. List User's Posts

- Make a `GET` request to `/api/v1/users/:user_id/posts`.
- Include the authentication token in the headers.

### 4. List Comments for a Post

- Make a `GET` request to `/api/v1/users/:user_id/posts/:post_id/comments`.
- Include the authentication token in the headers.

### 5. Add a Comment to a Post

- Make a `POST` request to `/api/v1/users/:user_id/posts/:post_id/comments`.
- Include the authentication token in the headers.
- Provide the comment content in the request body.
  - Example:
    ```json
    {
      "comment": {
        "content": "This is a great post!"
      }
    }
    ```

Feel free to use Postman to test the various API endpoints and explore the functionality of the Blog App API.


## 👥 Author <a name="authors"></a>

👤 **Burhan Uddin**

- GitHub: [Burhan Uddin](https://github.com/BHObserver/)
- Twitter: [Burhan Uddin](https://twitter.com/BurhanU14173360)
- LinkedIn: [Burhan Uddin](https://www.linkedin.com/in/bhobserver/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name='future-features'></a>

- [ ]  Validations and Model specs.
- [ ]  Add more features to the app.
- [ ]  Add more tests.
- [ ]  Add more styling.
- [ ] Add more features to the app.
- [ ]  Add more tests.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/bhobserver/blog-app/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

If you like this project, kindly drop a star ⭐️ for the [repository](https://github.com/bhobserver/blog-app.git);

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

I want to thank Sadaf and Ben for always availing themselves of detailed project discussions. I thank Microverse for the chance to become a software developer.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
