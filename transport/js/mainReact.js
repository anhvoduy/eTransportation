/** JSX React.DOM */
(function(){
    'use strict';
    var data = {
        title: 'Our Short Story',
        imageUrl: 'images/bg.jpg',
        desc: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        moreInfo: 'More about info ...'
    }

    var StoryArea = React.createClass({
        getInitialState: function(){
            return this.props.data;
        },
        render: function(){            
            return (
                <section id="story_area" className="section_padding">
                    <div className="container">
                        <div className="row">
                            <div className="col-md-6">
                                <div className="story_image slideInLeft" data-wow-duration="2s">
                                    <img src={this.state.imageUrl} alt=""/>
                                </div>
                            </div>
                            <div className="col-md-6">
                                <div className="story_text slideInRight" data-wow-duration="2s">
                                    <h2>{this.state.title}</h2>
                                    <p>{this.state.desc}</p>
                                    <p>{this.state.desc}</p>
                                    <a href="">{this.state.moreInfo}</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            );
        }
    });

    ReactDOM.render(<StoryArea data={data} />, document.getElementById('wpStoryArea'));

})();